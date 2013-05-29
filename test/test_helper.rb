require 'maildotyml'
require 'minitest/autorun'
require 'pathname'

FIXTURES_ROOT = Pathname.new(__FILE__).dirname.join('fixtures')

def fixture(name)
  FIXTURES_ROOT.join("#{name}.yml")
end
