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
    assert_instance_of Shift, @enigma1.key_and_offset_shifts
    assert_instance_of Array, @enigma1.final_shifts
  end

  def test_it_can_encrypt
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    assert_equal expected, @enigma1.encrypt("hello world", "02715", "040895")
  end
end
