[![Build Status](https://secure.travis-ci.org/grasshoppergroup/adhearsion-fax.png?branch=master)](http://travis-ci.org/grasshoppergroup/adhearsion-fax)

# Adhearsion Fax

This plugin aims to provide a basic fax implementation.

## Compatibility

* Asterisk - no
* FS/Event Socket - no
* FS/[mod_rayo](https://wiki.freeswitch.org/wiki/Mod_rayo) - yes

To use currently, you'll have to specify a feature branch of [punchblock](https://github.com/adhearsion/punchblock/tree/feature/cpa_fax) in your Gemfile:

```ruby
gem 'punchblock', github: "adhearsion/punchblock", branch: "feature/cpa_fax"
```

## Usage

To send a fax:

```ruby
send_fax "http://shakespere.lit/my_fax.tiff",identity: '1112223333', header: 'This is a fax for you', pages: 1..4
```

To send multiple faxes with a common header and unique pages:

```ruby
send_fax({'http://example.com/fax.tiff' => {pages: 1..2}, 'http://example.com/fax2.tiff' => {pages: 3..4}}), header: "Same"
```

To receive a fax (presumably after knowing you're getting a fax tone due to [adhearsion-cpa](https://github.com/grasshoppergroup/adhearsion-cpa)):

```ruby
fax = receive_fax
```

## More Information

Specification: [rayo-fax](https://github.com/rayo/xmpp/blob/rayo/extensions/inbox/rayo-fax.xml)

## Credits

Original author: [Justin Aiken](https://github.com/JustinAiken)

Developed by [Mojo Lingo](http://mojolingo.com) in partnership with [Grasshopper](http://http://grasshopper.com/).
Thanks to [Grasshopper](http://http://grasshopper.com/) for sponsorship of Adhearsion Fax.

## Links

* [Source](https://github.com/grasshoppergroup/adhearsion-fax)
* [Bug Tracker](https://github.com/grasshoppergroup/adhearsion-fax/issues)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Adhearsion Foundation Inc. MIT license (see LICENSE for details).
