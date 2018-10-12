class Oystercard
  attr_reader :balance
  def initialize
    @balance = 0.00
    @limit = 90
    @in_journey = false
  end
  
  def top_up(amount)
    card_limit(amount) == true ? @balance += amount : raise(StandardError, "Top up would go over £#{@limit} limit")
  end
  
  def card_limit(amount)
    @balance + amount > @limit ? false : true
  end
  
  def deduct(amount)
    @balance -= amount
  end
  
  def in_journey?
    @in_journey == true ? true : false
  end
  
  def touch_in
    @in_journey == true ? raise(StandardError, "Already on a journey") : @in_journey = true
  end
  
  def touch_out
    @in_journey == false ? raise(StandardError, "Not on a journey") : @in_journey = false
  end
end