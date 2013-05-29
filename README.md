# Maildotyml

Configure ActionMailer with mail.yml, like ActiveRecord and database.yml.

[![Build Status](https://travis-ci.org/carnesmedia/maildotyml.png)](https://travis-ci.org/carnesmedia/maildotyml)
[![Coverage Status](https://coveralls.io/repos/carnesmedia/maildotyml/badge.png)](https://coveralls.io/r/carnesmedia/maildotyml)


## Installation

Add this line to your application's Gemfile:

    gem 'maildotyml'

And then execute:

    $ bundle

## Usage

Add a `config/mail.yml` to your project.

Here is an example to get you started:

```yaml
development:
  adapter: :smtp
  address: 'localhost'
  port: 25
  domain: 'localhost.localdomain'
  enable_startttls_auto: true

test:
  adapter: :test

production:
  adapter: :smtp
  # Note that some standard activerecord options are automatically translated.
  host: 'your.smtp.server'
  port: 25
  authentication: 'login'
  domain: 'your.domain-to.authenticate-to.smtp.com'
  username: <%= ENV['MAIL_USERNAME'] %>
  password: <%= ENV['MAIL_PASSWORD'] %>
  enable_startttls_auto: true
```

### ActiveRecord style keys

In order to be more like ActiveRecord configuration, maildotyml automatically
maps some configuration keys. For example, ActiveRecord expects a `username` for
database connection. ActionMailer expects `user_name` for smtp configuration.

With maildotyml, either will work.

#### Supported mappings

* `username` -> `user_name`
* `host` -> `address`

## TODO

The following features are planned for the near future:

* Add a generator to create `config/mail.yml.example` with example configuration.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
