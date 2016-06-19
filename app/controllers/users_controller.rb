class UsersController < ApplicationController
  respond_to :json
  def index
    respond_with User.all
  end

  def index_paginate
    respond_with User.page(params[:page]).per(params[:per_page])
  end
  ###This more useful with username
  def find_by_mail
    respond_with User.where(email: params[:email])
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201 
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end