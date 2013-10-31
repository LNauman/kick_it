require 'spec_helper'

feature 'users can view a public activity feed', %Q{
  As an user
  I want to see an activity feed
  So that I can be updated on new activity } do

  # Acceptance Criteria

  # * I must be able to click a button to go to the public activity feed
  # * I must be able to see activity by other users such as: lists being completed,
  #   adding a new list, or completing a new list item

  let(:user) { FactoryGirl.create(:user) }
  # let(:bucket_list) { FactoryGirl.create(:bucket_list, user: user) }

  scenario 'user creates an adventure, sees info in feed' do

    sign_in_as(user)
  
    visit "/users/#{user.id}/bucket_lists/#{bucket_list.id}/"

    page.should have_content(bucket_list.title)
    page.attach_file('adventure_picture', Rails.root + 'spec/support/images/stevie-nick.jpg')
    click_on 'Finish adventure!'
    page.should have_content('Photo Updated')
  end

  scenario 'user updates an adventure, sees info in feed' do
  scenario 'user creates a bucket list, sees info in feed' do
  scenario 'user updates an adventure, sees info in feed' do


end
