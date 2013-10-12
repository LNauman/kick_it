class BucketList < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :user
  
  has_many :adventures, inverse_of: :bucket_list, dependent: :destroy
  belongs_to :user, inverse_of: :bucket_lists

  def complete?
    adventures.where(state: 'incomplete').count == 0
  end

  def self.completed
    result = []
    BucketList.all.each do |list|
      if list.complete?
        result << list
      end
    end
    result
  end
  
end
