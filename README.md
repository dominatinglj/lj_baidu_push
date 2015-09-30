# LjBaiduPush

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lj_baidu_push`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lj_baidu_push'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lj_baidu_push

## Usage

LjBaiduPush.api_key = "rZ8XbPri7PPlB8TpLWGRFsDd"
LjBaiduPush.secret_key = "f2a8f68c4c31cfae879f04e669ce164b"

#apple
message           = {
  "aps"         => {
    "alert"  => "消息测试",
    "content-available" => '1'
  },
  "key1"        => "value1",
  "key2"        => "value2"
}
LjBaiduPush.push_single_device(channel_id,message)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lj_baidu_push.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

