require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  def arbitrary_values
    [nil, 123, 'foo', :bar, [], {}, Object.new]
  end

  test '#decorated? returns false on arbitrary types' do
    arbitrary_values.each { |x| assert_respond_with x, :decorated?, false }
  end

  test '#decorated? returns true on decorators' do
    d = DressyModels::Decorator.new(Object.new)
    assert_respond_with d, :decorated?, true
  end

  test '#undecorate returns self on arbitrary types' do
    arbitrary_values.each { |x| assert_respond_with x, :undecorate, x }
  end

  test '#undecorate returns the component on decorators' do
    o = Object.new
    d = DressyModels::Decorator.new o
    assert_respond_with d, :undecorate, o
  end
end
