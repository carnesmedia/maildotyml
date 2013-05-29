# Maildotyml

Configure ActionMailer with mail.yml, like ActiveRecord and database.yml.

[![Build Status](https://travis-ci.org/carnesmedia/maildotyml.png)](https://travis-ci.org/carnesmedia/maildotyml)


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
  address: 'your.smtp.server'
  port: 25
  authentication: 'login'
  domain: 'your.domain-to.authenticate-to.smtp.com'
  user_name: <%= ENV['MAIL_USERNAME'] %>
  password: <%= ENV['MAIL_PASSWORD'] %>
  enable_startttls_auto: true
```

## TODO

The following features are planned for the near future:

* Add a generator to create `config/mail.yml.example` with example configuration.
* Raise an exception if the configured delivery method does not exist
* Map common ActiveRecord configuration keys.
  (ie, `username` -> `user_name`).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
