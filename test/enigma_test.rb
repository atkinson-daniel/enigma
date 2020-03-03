require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/enigma"


class EnigmaTest < Minitest::Test
  def setup
    @enigma1 = Enigma.new
    @enigma2 = Enigma.new
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
    assert_equal expected2, @enigma2.encrypt("hello, world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected1 =
                {
                   decryption: "hello world",
                   key: "02715",
                   date: "040895"
                }

    expected2 =
                {
                   decryption: "hello, world",
                   key: "02715",
                   date: "040895"
                }

    assert_equal expected1, @enigma1.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected2, @enigma2.decrypt("keder, ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_without_given_key_or_offset
    expected1 =
                {
                   encryption: "lib sdmcvpu",
                   key: "02715",
                   date: "020320"
                }
    expected2 =
                {
                   encryption: "lib s,dmcvpu",
                   key: "02715",
                   date: "020320"
                }
    Date.stubs(:today).returns(Date.new(2020, 03, 02))

    assert_equal expected1, @enigma1.encrypt("hello world", "02715")
    assert_equal expected2, @enigma1.encrypt("hello, world", "02715")
  end

  def test_it_can_return_encrypted_message
    assert_equal "keder ohulw", @enigma1.encrypted("hello world", [3, 27, 73, 20])
    assert_equal "keder, ohulw", @enigma2.encrypted("hello, world", [3, 27, 73, 20])
  end

  def test_it_can_return_decrypted_message
    assert_equal "hello world", @enigma1.decrypted("keder ohulw", [3, 27, 73, 20])
    assert_equal "hello, world", @enigma2.decrypted("keder, ohulw", [3, 27, 73, 20])
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

  def test_shifts_can_create_key_shifts
    shift = Shift.new
    shift.stubs(:key).returns("12345")

    expected = [12, 23, 34, 45]

    assert_equal expected, shift.key_shift
  end

  def test_shifts_can_create_offset_shifts
    Date.stubs(:today).returns(Date.new(2020, 02, 12))
    shift = Shift.new

    expected = [8, 4, 0, 0]

    assert_equal expected, shift.offset_shift
  end

  def test_shifts_can_create_shifts
    Date.stubs(:today).returns(Date.new(2020, 02, 12))
    shift = Shift.new
    shift.stubs(:key).returns("12345")

    expected = [20, 27, 34, 45]

    assert_equal expected, shift.shifts
  end
end
