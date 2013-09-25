class BucketListsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy]
  def new
    @bucket_list = BucketList.new
  end

  def index
    if current_user
      #when bucket lists can be completed I will make 2 instance variables here so i can pass two lists to the view
      @bucket_lists = current_user.bucket_lists
      # @completed_bucket_lists = current_user.completed_bucket_lists
      @completed_bucket_lists = current_user.bucket_lists
    else
      @bucket_lists = BucketList.all
    end
  end

  def create
    @bucket_list = BucketList.new(reg_params)
    @bucket_list.user = current_user
    if @bucket_list.save
      flash[:notice] = "Your bucket list is created! Add some list items!"
      redirect_to '/bucket_lists'
      #make this go to the dashboard page wooo
    else
      render 'new'
    end
  end

  protected

  def reg_params
    params.require(:bucket_list).permit(
      :title,
      :category
      )
  end


end
