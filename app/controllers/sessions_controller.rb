class Users::SessionsController < Devise::SessionsController
  layout "application"

  # POST /login
  def create
    super do |user|
      if user.persisted?
        user.update_attributes(foo: :bar)
      end
    end
  end
end