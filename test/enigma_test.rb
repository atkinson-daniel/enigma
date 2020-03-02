require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/shift"
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def setup
    @enigma1 = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma1
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                " "]
    assert_equal expected, @enigma1.alphabet
  end

  def test_it_can_create_offset_shifts
    assert_equal [2, 4, 0, 0], @enigma1.offset_shift("010320")
  end

  def test_it_can_create_key_shifts
    assert_equal [12, 23, 34, 45], @enigma1.key_shifts("12345")
  end
end
