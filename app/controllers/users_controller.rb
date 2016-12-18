class UsersController < ApplicationController

  def create
    @user = User.find_or_create_by(user_params)
  end

  def new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:facebook_id, :username)
  end
end
