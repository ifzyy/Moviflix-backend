class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      name: params["user"]["name"],
      email: params["user"]["email"],
      password: params["user"]["password"],
      password_confirmation: params["user"]["password_confirmation"],
    )
    if user
     session[:current_user_id] = user.id
      render json: {
               status: :created,
               user: user
             }
    else
      render json: { status: 500, message: user.errors.full_messages }
    end
  end
end
