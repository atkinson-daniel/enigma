class Shift
  attr_reader :key, :offset

  def initialize
    @key = (0..9).to_a.sample(5).join
    @offset = Date.today.strftime("%d%m%y")
  end

  def key_shift
    collection = []
    key.chars.each_cons(2) do |a|
      collection << (a.sum(&:to_i))
    end
    collection
  end

  def offset_shift
    squared = (offset.to_i * offset.to_i)
    last_four_digits = squared.to_s[-4..-1]
    last_four_digits.to_i.digits.reverse
  end

  def shifts
    @shifts ||= begin
      set_of_shifts = offset_shift.zip(key_shift)
      set_of_shifts.map! {|set| set.sum }
    end
  end
end
