class V1::SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first
    if user&.valid_password?(params[:password])
      return json:user.as_json(only:[:email, :authentication_token]), status: :created
    else
      head(:unauthorized)
  end

  def destroy

  end
end
