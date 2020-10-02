
class PaymentMethod
  def initialize
    @abstract_class = true
  end

  def create_payment(order, product)
    raise NotImplementedError
  end

  def execute_payment(payment_id, user_id)
    raise NotImplementedError
  end

  def create_subscription(order, product)
    raise NotImplementedError
  end
end