require 'coveralls'
Coveralls.wear!

require 'maildotyml'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/fire_mock'
require 'pathname'

FIXTURES_ROOT = Pathname.new(__FILE__).dirname.join('fixtures')

def fixture(name)
  FIXTURES_ROOT.join("#{name}.yml")
end
