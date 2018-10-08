class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

def top_up(val)

  fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + val > MAXIMUM_BALANCE
  @balance += val
 end

end
