require_relative "config_parser/version"

module ConfigParser
  class Parser
    attr_accessor :config_file, :params

    # Initialize the class with the path to the 'config_file'
    # The class objects are dynamically generated by the
    # name of the 'param' in the config file.  Therefore, if
    # the config file is 'param = value' then the initializer
    # will eval "@param = value"
    def initialize(config_file='../config_parser/example_config.conf', comments=%w{# ;})
      @config_file = config_file
      @params = {}
      @splitRegex = '\s*=\s*'
      @comments = comments

      # validate the file and extract the content
      self.validate_file
      self.import_config_content_from_file
    end

    # Validate the config file, and contents
    def validate_file
      unless File.readable?(self.config_file)
        raise Errno::EACCES, "#{self.config_file} is not readable"
      end
    end

    # Import data from the config to our config object.
    def import_config_content_from_file
      open(self.config_file) {|f| f.each_with_index do |line, i|

        line.strip!

        # force_encoding not available in all versions of ruby
        begin
          if i.eql? 0 and line.include?("\xef\xbb\xbf".force_encoding("UTF-8"))
            line.delete!("\xef\xbb\xbf".force_encoding("UTF-8"))
          end
        rescue NoMethodError
        end

        # validate if line is comment or not
        is_comment = false
        @comments.each do |comment|
          if (/^#{comment}/.match(line))
            is_comment = true
            break
          end
        end

        unless is_comment
          if(/#{@splitRegex}/.match(line))
            param, value = line.split(/#{@splitRegex}/, 2)
            var_name = "#{param}".chomp.strip

            # just in case value has trailing comments
            value = value.split('#').first.chomp.strip

            new_value = ''
            if (value)
              if value =~ /^['"](.*)['"]$/
                new_value = $1
              else
                new_value = value
              end
            end
          self.params[var_name] = new_value
          end
        end
      end}
    end
  end
end