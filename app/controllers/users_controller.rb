class UsersController < ApplicationController
	respond_to :json
	def index
		respond_with User.all
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

	def destroy
		user = User.find(6)
		user.destroy
		head 204
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end