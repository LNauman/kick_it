class AdventuresController < ApplicationController
  def new
    @adventure = Adventure.new
    @bucket = BucketList.find(params[:bucket_list_id])
  end

  def create
    @adventure = Adventure.new(adventure_params)
    @adventure.user_id = current_user.id
    @bucket = BucketList.find(params[:bucket_list_id])
    @adventure.bucket_list_id = @bucket.id

    if @adventure.save
      flash[:notice] = 'Your new adventure has been added to this list'
      redirect_to bucket_list_path(@bucket)
    else
      render :new
    end
  end

  def update
    @adventure = Adventure.find(params[:id])

    if @adventure.update_attributes!( adventure_params )
      if @adventure.picture
        @adventure.complete
      end
      redirect_to bucket_list_path(@adventure.bucket_list), notice: 'Photo Updated'
    else
      flash[:alert] = 'Please provide a photo'
      render :show
    end
  end

  def index
    @all_adventures = Adventure.all
    if params[:bucket_list_id]
      @bucket_list = BucketList.find( params[:bucket_list_id] )
      @adventures = Adventure.where( bucket_list_id: @bucket_list.id )
    else
      @bucket_list = nil
      @adventure = Adventure.all
    end
  end

  protected
  def adventure_params
    params.require(:adventure).permit(
      :adventure_description,
      :picture
      )
  end
end
