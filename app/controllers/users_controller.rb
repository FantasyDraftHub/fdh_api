class UsersController < ApplicationController
  before_action :authenticate, except: [ :create ]
  def show
    render json: current_user, status: 201
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: user.errors, status: 400
    end
  end

  def update
    user = User.find_by_id(params[:id])
    if user.update(user_params)
      render json: user, status: 201
    else
      render json: user.errors, status: 400
    end
  end

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end