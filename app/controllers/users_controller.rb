class UsersController < ApplicationController

  def create
    @user = User.create()
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
