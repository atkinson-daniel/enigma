class Enigma
  attr_reader :alphabet, :key_and_offset_shifts, :final_shifts
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key_and_offset_shifts = Shift.new
    @final_shifts = @key_and_offset_shifts.shifts
  end

  def encrypt(message, key = @key_and_offset_shifts.key,
              date = @key_and_offset_shifts.date)
      {encryption: encrypted(message),
       key: key,
       date: date}
  end

  def decrypt
  end

  def encrypted(message)
    require "pry"; binding.pry
  end
end
