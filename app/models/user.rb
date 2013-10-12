class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_presence_of :picture
  
  has_many :bucket_lists, inverse_of: :user, dependent: :destroy
  has_many :adventures, inverse_of: :user, dependent: :destroy

  mount_uploader :picture, PictureUploader

  def completed_lists
    @completed_bucket_lists = []
      
    bucket_lists.each do |list|
      if list.complete?
        @completed_bucket_lists << list
      end
    end
    @completed_bucket_lists
  end

end
