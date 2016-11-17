require 'test_helper'

#
class DecoratableTest < ActiveSupport::TestCase
  #
  class TestType
    include DressyModels::Decoratable
  end

  #
  class TestTypeDecorator < DressyModels::Decorator
  end

  test 'should decorate and undecorate correctly' do
    x = TestType.new
    assert_respond_to x, :decorate
    assert_not x.decorated?

    d = x.decorate
    assert_instance_of TestTypeDecorator, d
    assert d.decorated?

    u = d.undecorate
    assert_instance_of TestType, u
    assert_not u.decorated?
    assert_same x, u
  end
end
