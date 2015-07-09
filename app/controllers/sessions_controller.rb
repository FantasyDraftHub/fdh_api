class SessionsController < ApplicationController
  before_action :authenticate, except: [ :create ]

  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      user.generate_token
      render json: {email: user.email, name: user.name, token: user.token}, status: 201
    else
      render json: {errors: {login: ['Invalid Login']}}, status: 401
    end
  end

  def logout
    user = current_user
    user.token = nil
    user.save

    render nothing: true, status: :no_content
  end

  def session_params
    params.permit(:email, :password)
  end

end