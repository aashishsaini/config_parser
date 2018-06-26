# ConfigParser

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/config_parser`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'config_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install config_parser

## Usage

An example configuration file might look like:

```
# This is what a comment looks like, ignore it
# All these config lines are valid
host = test.com
server_id=55331
server_load_alarm=2.5
user= john # comment can appear here as well
verbose =true
test_mode = on
debug_mode = off
log_file_path = /tmp/logfile.log
send_notifications = yes
```
Access it with ConfigParser:
```ruby
>> require 'config_parser'
=> true

>> config = ConfigParser::Parser.new('/path/to/config/example.conf')
OR
>> config = ConfigParser::Parser.new

=> #<ConfigParser::Parser:0x007f8bb52fd580
      @config_file="example.conf",
      @params={
            "param1"=>"value1"
            "param2"=>"value2"
    }>
>> config.params will show the resultant hash that can be used within the application
=>  {"host"=>"test.com", "server_id"=>"55331", "server_load_alarm"=>"2.5", "user"=>"john", "verbose"=>"true", "test_mode"=>"on", "debug_mode"=>"off", "log_file_path"=>"/tmp/logfile.log", "send_notifications"=>"yes"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/config_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ConfigParser project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/config_parser/blob/master/CODE_OF_CONDUCT.md).
