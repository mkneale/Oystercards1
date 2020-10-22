class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_accessor :balance, :journey

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    fail ("Maximum balance of 90 exceeded") if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct_money(fare)
    @balance -= fare
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail ("Too little balance. Card now has a balance of #{balance}") if balance < MINIMUM_FARE
    @journey = true
  end

  def touch_out
    @balance -= MINIMUM_FARE
    @journey = false
  end

end
