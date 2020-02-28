class Shift
  attr_accessor :key, :offset

  def initialize
    @key = rand(0..99999).to_s.rjust(5, "0")
    @offset = Date.today.strftime("%d%m%y")
  end
end
