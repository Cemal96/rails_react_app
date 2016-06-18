class AuthController < ApplicationController
  def is_signed_in?
    if User.find_by(auth_token: request.headers['Authorization'])
      render :json => {"signed_in" => true, "user" => current_user}
    else
      render :json => {"signed_in" => false}, status:404
    end
  end
end