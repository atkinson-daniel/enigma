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

  def test_it_can_encrypt
    expected1 =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    expected2 =  {
                  encryption: "keder, ohulw",
                  key: "02715",
                  date: "040895"
                }
    assert_equal expected1, @enigma1.encrypt("hello world", "02715", "040895")
    assert_equal expected2, @enigma1.encrypt("hello, world", "02715", "040895")
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", @enigma1.encrypted("hello world", [3, 27, 73, 20])
    assert_equal "keder, ohulw", @enigma1.encrypted("hello, world", [3, 27, 73, 20])
  end

  def test_it_can_create_offset_shifts
    assert_equal [2, 4, 0, 0], @enigma1.offset_shift("010320")
  end

  def test_it_can_create_key_shifts
    assert_equal [12, 23, 34, 45], @enigma1.key_shifts("12345")
  end

  def test_it_can_create_shifts
   assert_equal [6, 6, 6, 6], @enigma1.create_shifts([1, 2, 3, 4], [5, 4, 3, 2])
  end
end
