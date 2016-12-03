class BankAccount

  attr_reader :name
  attr_accessor :status, :balance

  def initialize (name = "Avi")
    @name = name
    @balance = 1000.0
    @status = "open"
  end

  def deposit (amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @status == 'open' && @balance > 0
  end

  def close_account
    @status = 'closed'
  end

end
