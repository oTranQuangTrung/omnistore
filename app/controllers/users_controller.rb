class UsersController < ApplicationController
  before_action :load_user, :correct_user

  def show
  end

  private
  def load_user
    @user = User.find params[:id]
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user)
  end
end
