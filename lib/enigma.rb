class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def key_shifts(key)
    key_shifts = []
    key.chars.each_cons(2) do |a|
      key_shifts << (a.join.to_i)
    end
    key_shifts
  end
end
