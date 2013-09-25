class BucketList < ActiveRecord::Base
  
  belongs_to :user, inverse_of: :bucket_lists
  validates_presence_of :title
  validates_presence_of :user
end
