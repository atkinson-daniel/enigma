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

    assert_instance_of String, shift.key
    assert_equal 5, shift.key.length
    assert_instance_of String, shift.offset
    assert_equal 6, shift.offset.length
    assert_equal "120220", shift.offset
  end

  def test_it_can_create_a_key_shift
    shift = Shift.new
    shift.stubs(:key).returns("12345")

    expected = [12, 23, 34, 45]

    assert_equal expected, shift.key_shift
  end

  def test_it_can_create_an_offset_shift
    Date.stubs(:today).returns(Date.new(2020, 02, 12))
    shift = Shift.new

    expected = [8, 4, 0, 0]

    assert_equal expected, shift.offset_shift
  end

  def test_it_can_create_shifts
    Date.stubs(:today).returns(Date.new(2020, 02, 12))
    shift = Shift.new
    shift.stubs(:key).returns("12345")

    expected = [20, 27, 34, 45]

    assert_equal expected, shift.shifts
  end
end
