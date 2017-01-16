class Receipt
  attr_accessor :amount

  def check_receipt(budget)
    attr_accessor :receipt
    monthly_total = 1
    monthly_total + amount >= budget ? "reject" : "accept"
  end
end
receipt = Receipt.new
receipt.amount = 199
receipt.amount
receipt.check_receipt(200)
