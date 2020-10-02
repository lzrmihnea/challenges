require 'test_helper'
require 'payment/payment_factory'

class PaymentFactoryTest < ActiveSupport::TestCase
  test "Question 3: Stripe payment factory:" do
    payment_factory = PaymentFactory.new("stripe")
    puts 'Created payment factory: '
    puts payment_factory.inspect
    assert_kind_of(PaymentMethodStripe, payment_factory.get_payment_provider)
  end

  test "Question 3: Paypal payment factory:" do
    # payment_factory = PaymentFactory.new
    payment_factory = PaymentFactory.new("paypal")
    puts 'Created payment factory: '
    puts payment_factory.inspect
    assert_kind_of(PaymentMethodPaypal, payment_factory.get_payment_provider)
  end
end
