class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Jungle receipt order #{@order.id}")
  end
end
