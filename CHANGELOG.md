# Changelog

## Version 0.0.6

* Fix a bug affecting rails startup

## Version 0.0.5

* Fix bug in generator where erb tags intended to be in the template were
  interpreted by rails.

## Version 0.0.4

* Add a generator that installs an example config/mail.yml.example.

## Version 0.0.3

* Map ActiveRecord style configuration keys

## Version 0.0.2

* Handle missing mail.yml and missing envorinment
* Raise an error when configured delivery method does not exist

## Version 0.0.1

* Initial version parses mail.yml in Rails.root/config/mail.yml
