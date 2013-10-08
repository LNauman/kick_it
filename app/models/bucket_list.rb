class BucketList < ActiveRecord::Base
  
  has_many :adventures,
    inverse_of: :bucket_list,
    dependent: :destroy
  
  belongs_to :user, 
    inverse_of: :bucket_lists

  
  validates_presence_of :title
  validates_presence_of :user
end
