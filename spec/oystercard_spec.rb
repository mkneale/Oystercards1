require 'oystercard'

RSpec.describe Oystercard do

  it { is_expected.to respond_to('balance') }

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if limit is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE #gets variable from class
      subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

    describe '#deduct_money' do
      it 'deducts fare from balance' do
        expect{ subject.deduct_money 1 }.to change{ subject.balance }.by -1
      end
    end

    it 'is initially not in journey' do # in journey is set to false as standard
      expect(subject).not_to be_in_journey
    end

    # touch in method should cause @journey to be set to true

    # need tests to require balance to be topped up

    it 'can touch in' do
      subject.top_up(50) # putting balance on oystercard in order to be able to tap in
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'can touch out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    context 'touch in without minimum fare' do
      it 'raises an error if touch_in with balance less than minimum_fare' do
        expect { subject.touch_in }.to raise_error("Too little balance. Card now has a balance of #{subject.balance}")
      end
    end
end
