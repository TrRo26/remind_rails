class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
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
