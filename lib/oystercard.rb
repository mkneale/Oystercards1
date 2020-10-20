class Oystercard

  MAXIMUM_BALANCE = 90

  attr_accessor :balance, :journey

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail ("Maximum balance of 90 exceeded") if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct_money(fare)
    @balance -= fare
  end

  def in_journey?
    false
    @journey
  end

  def touch_in
    @journey = true if @balance > 0
  end

  def touch_out
    @journey = false
  end

end
