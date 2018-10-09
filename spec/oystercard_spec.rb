require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'responds to balance' do
      expect(subject).to respond_to(:balance)
    end
    it 'balance should be 0 on initialization' do
      expect(subject.balance).to eq 0.00
    end
  end
end