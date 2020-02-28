require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/shift"

class ShiftTest < Minitest::Test
  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    Date.stubs(:today).returns(Date.new(2020, 02, 12))
    shift = Shift.new

    #IDK how to test for key
    assert_instance_of String, shift.key
    assert_equal 5, shift.key.length
    assert_instance_of String, shift.offset
    assert_equal 6, shift.offset.length
    assert_equal "120220", shift.offset
  end
end
