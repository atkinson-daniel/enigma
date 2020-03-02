class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = Shift.new.create_key, date = Shift.new.offset)
    {encryption: encrypted(message, create_shifts(key_shifts(key), offset_shift(date))),
    key: key,
    date: date}
  end

  def encrypted(message, shifts)
    message_index = 0
    shifts_index = 0
    new_message = []
    until message_index == message.length
      if @alphabet.include?(message[message_index])
        to_rotate = @alphabet.index(message[message_index]) + shifts[shifts_index]
        new_message << @alphabet.rotate(to_rotate).first
        message_index += 1
        shifts_index += 1
        shifts_index = 0 if shifts_index == 4
      else
        new_message << message[message_index]
        message_index += 1
      end
    end
    new_message.join
  end

  def create_shifts(key_shifts, offset_shifts)
    set_of_shifts = offset_shifts.zip(key_shifts)
    set_of_shifts.map! {|set| set.sum }
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
