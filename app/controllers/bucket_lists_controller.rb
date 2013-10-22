class BucketListsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy]
  
  def new
    @bucket_list = BucketList.new
  end

  def index
    if current_user
      @user = current_user
      @bucket_lists = current_user.bucket_lists
      @completed_bucket_lists = @user.completed_lists

    else
      @bucket_lists = BucketList.all
      @completed_bucket_lists = BucketList.completed
    end
  end

  def create
    @bucket_list = BucketList.new(reg_params)
    @bucket_list.user = current_user
    if @bucket_list.save
      flash[:notice] = "Your bucket list is created! Add some list items!"
      redirect_to '/bucket_lists'
    else
      render 'new'
    end
  end

  def show
    @bucket_list = BucketList.find(params[:id])
  end

  def destroy
    if current_user
      @user = current_user
      @bucket_list = BucketList.find(params[:id])
      @bucket_list.destroy
      redirect_to "/users/#{@user.id}/bucket_lists/"
    end
  end 

  protected

  def reg_params
    params.require(:bucket_list).permit(
      :title
      )
  end


end
