class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def offset_shift(date)
    squared = (date.to_i * date.to_i)
    last_four_digits = squared.to_s[-4..-1]
    last_four_digits.to_i.digits.reverse
  end

  def key_shifts(key)
    key_shifts = []
    key.chars.each_cons(2) do |a|
      key_shifts << (a.join.to_i)
    end
    key_shifts
  end
end
