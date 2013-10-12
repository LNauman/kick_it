class Adventure < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  state_machine :state, :initial => :incomplete do
    event :complete do
      transition :incomplete => :completed
    end
  end

  validates_presence_of :bucket_list
  validates_presence_of :adventure_description

  belongs_to :user, inverse_of: :adventures
  belongs_to :bucket_list, inverse_of: :adventures
end
