class AuthController < ApplicationController
  def is_signed_in?
    if user_signed_in?
      render :json => {"signed_in" => true, "user" => current_user}
    else
      render :json => {"signed_in" => false}
    end
  end
  ## I think this function not need, but i keep it
  def is_admin?
    if user_admin?
      render :json => {"admin" => true, "user" => current_user}
    else
      render :json => {"admin" => false}
    end
  end
end