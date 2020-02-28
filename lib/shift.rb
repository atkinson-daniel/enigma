class Shift
  include Collectable
  attr_reader :key, :offset

  def initialize
    @key = rand(0..99999).to_s.rjust(5, "0")
    @offset = Date.today.strftime("%d%m%y")
  end

  def key_shift
    collection = []
    key.chars.each_cons(2) do |a|
      collection << ((a.map!(&:to_i)).sum)
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
