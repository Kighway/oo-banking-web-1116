require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && status == "pending" && sender.balance >= amount
      sender.deposit(-amount)
      receiver.deposit(+amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if sender.valid? && receiver.valid? && status == "complete" && receiver.balance >= amount
      sender.deposit(+amount)
      receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end
