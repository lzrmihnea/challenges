require 'payment/payment_method_paypal'
require 'payment/payment_method_stripe'

class PaymentFactory
  def initialize(payment_method)
    case payment_method.upcase
    when 'PAYPAL'
      @payment_provider = PaymentMethodPaypal.new
    when 'STRIPE'
      @payment_provider = PaymentMethodStripe.new
    else
      raise NotImplementedError
    end
  end

  def create_payment(order, product)
    @payment_provider.create_payment(order, product)
  end

  def execute_payment(payment_id, user_id)
    @payment_provider.execute_payment(payment_id, user_id)
  end

  def create_subscription(payment_id, user_id)
    @payment_provider.create_subscription(payment_id, user_id)
  end

  def get_payment_provider
    @payment_provider
  end

end
