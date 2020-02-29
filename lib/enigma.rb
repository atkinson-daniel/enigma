class Enigma
  attr_reader :alphabet, :key_and_offset_shifts, :final_shifts
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key_and_offset_shifts = Shift.new
    @final_shifts = @key_and_offset_shifts.shifts
  end

  def encrypt
  end

  def decrypt
  end
end
