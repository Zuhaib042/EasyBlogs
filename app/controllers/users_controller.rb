class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order('id ASC')
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
