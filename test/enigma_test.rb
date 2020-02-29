require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/shift"
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                " "]
    assert_equal expected, @enigma.alphabet
    assert_instance_of Shift, @enigma.key_and_offset_shifts
    assert_instance_of Array, @enigma.final_shifts
  end
end
