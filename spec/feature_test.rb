require './lib/oystercard'

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

card1 = Oystercard.new
card1.top_up(30)
puts "touch in for card1"
puts card1.touch_in
puts card1.in_journey?

# if card balance is below zero(minimum value)
card2 = Oystercard.new
puts "card 2"
puts card2.touch_in
puts card2.in_journey?
