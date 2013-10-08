class Adventure < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  validates_presence_of :bucket_list
  validates_presence_of :user
  validates_presence_of :adventure_description

  belongs_to :user,
    inverse_of: :adventures

  belongs_to :bucket_list, 
    inverse_of: :adventures
end
