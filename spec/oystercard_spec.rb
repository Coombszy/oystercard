require 'oystercard'

describe Oystercard do
  before do
    @Oystercard = Oystercard.new
  end
  describe '#balance' do
    it 'responds to balance' do
      expect(@Oystercard).to respond_to(:balance)
    end
    it 'balance should be 0 on initialization' do
      expect(@Oystercard.balance).to eq 0.00
    end
    it 'balance should equal a new value when topped up' do
      @Oystercard.top_up(10.23)
      expect(@Oystercard.balance).to eq 10.23
    end
  end
  describe '#top_up' do
    it 'responds to top_up' do
      expect(@Oystercard).to respond_to(:top_up)
    end
    it 'can increase balance correctly' do
      @Oystercard.top_up(32.5)
      expect(@Oystercard.balance).to eq 32.5
      @Oystercard.top_up(-2.25)
      expect(@Oystercard.balance).to eq 30.25
    end
    it 'cannot top up over 90' do
      @Oystercard.top_up(89.9)
      expect{@Oystercard.top_up(1.1)}.to raise_error(StandardError, "Top up would go over £90 limit")
    end
  end
  describe '#top_up' do
    it 'responds to deduct' do
      expect(@Oystercard).to respond_to(:deduct)
    end
    it 'can deduct from the balance' do
      @Oystercard.top_up(32.5)
      @Oystercard.deduct(30)
      expect(@Oystercard.balance).to eq 2.5
    end
  end
  describe '#in_journey?' do
    it 'responds to in_journey?' do
      expect(@Oystercard).to respond_to(:in_journey?)
    end
    it 'can return if its on a journey or not' do
      expect(@Oystercard.in_journey?).to eq false
    end
  end
  describe '#touch_in' do
    it 'responds to touch_in' do
      expect(@Oystercard).to respond_to(:touch_in)
    end
    it 'can touch into a journey and set in_journey to true' do
      @Oystercard.touch_in
      expect(@Oystercard.in_journey?).to eq true
    end
  end
  describe '#touch_out' do
    it 'responds to touch_out' do
      expect(@Oystercard).to respond_to(:touch_out)
    end
    it 'can touch out of a journey and set in_journey to false' do
      @Oystercard.touch_in
      @Oystercard.touch_out
      expect(@Oystercard.in_journey?).to eq false
    end
  end
end