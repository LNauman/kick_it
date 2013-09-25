require 'spec_helper'

feature "user creates a new list", %Q{
  As a signed in user
  I want to be able to create a new bucket list
  So that I can track my progress completing tasks
} do
  #Acceptance Criteria
  # * I must be able to enter a title for my new bucket list
  # * I must be able to select a category for my new bucket list
  # * I must be able to add new items to my new bucket list

  let(:user) {FactoryGirl.create(:user)}
  scenario 'user must be logged in to create bucket list' do
    visit new_bucket_list_path

    expect(page).to have_content('Sign in')

  end

  scenario 'specifies valid information, creates new bucket list' do
   
    sign_in_as(user)

    visit new_bucket_list_path

    fill_in 'Title', with: 'Philly List'
    select 'City', from: 'Category'
    click_button 'Save List!'

    expect(page).to have_content("Your bucket list is created! Add some list items!")
    expect(BucketList.last.user).to eql(user)
    expect(BucketList.last.category).to eql('City')
  end

  scenario 'user does not enter title, gets error message' do
    sign_in_as(user)
    visit new_bucket_list_path

    fill_in 'Title', with: ''
    select 'City', from: 'Category'
    click_button 'Save List!'

    expect(page).to_not have_content("Your bucket list is created! Add some list items!")
    expect(page).to have_content("Title can't be blank")
  end


end
