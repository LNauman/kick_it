require 'spec_helper'

feature 'users can upload a picture to complete an adventure', %Q{
  As an authenticated user
  I want to be able to upload a picture to complete an adventure
  So that I can show which items have been completed } do

  # Acceptance Criteria

  # * I must be able to complete an item on a current list
  #   by uploading a photo to a specific list item
  # * The image must be in valid format (jpg, png, ect)
  # * The image must within width/height and file size restrictions
  # * If I do not upload this type of photo, I get an error message
  # * If I am successful, I can see my image on my profile

  let(:user) { FactoryGirl.create(:user) }
  let(:bucket_list) { FactoryGirl.create(:bucket_list, user: user) }

  scenario 'with a picture selected' do

    sign_in_as(user)
  
    visit "/users/#{user.id}/bucket_lists/#{bucket_list.id}/"

    page.should have_content(bucket_list.title)
    page.attach_file('adventure_picture', Rails.root + 'spec/support/images/stevie-nick.jpg')
    click_on 'Finish adventure!'
    page.should have_content('Photo Updated')
  end
end
