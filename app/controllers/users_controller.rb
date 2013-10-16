class UsersController < ApplicationController
  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
     @user = User.find(params[:id])
     @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user.id)
  end

  def user_params
    params.require(:user).permit(:picture, :username)
  end


end
