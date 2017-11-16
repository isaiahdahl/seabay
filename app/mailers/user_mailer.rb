class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order.subject
  #
  def order(user, restaurant)
    @restaurant = restaurant
    @user = user
    @greeting = "Hi"

    mail(to: @restaurant.email, subject: 'We have fish for you!')
  end
end
