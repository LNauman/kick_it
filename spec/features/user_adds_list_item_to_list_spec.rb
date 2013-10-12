require 'spec_helper'

feature "user can add new list items", %Q{
  As a list haver
  I want to be able to add list items to my lists
  So that I can make sure my lists are current
} do
   
  # Acceptance Criteria
  # * When I click 'add item' for a specific list, 
  #   I must be able to add a new list item
  # * I must be able to enter up to 250 characters 
  # * I must be able to save this list item to the list I added it to

  let(:user) {FactoryGirl.create(:user)}
  let!(:bucket_list) {FactoryGirl.create(:bucket_list, user_id: user.id)}

  scenario 'specifies valid information, creates new bucket list item' do
    
    total_adventures = Adventure.count
    user_adventures_count = user.adventures.count

    sign_in_as(user)

    visit "/users/#{user.id}/bucket_lists/#{bucket_list.id}/"
  
    click_on 'Add item'
    
    fill_in 'Adventure description', with: 'skydive'
    
    click_on 'Create item!'

    expect(Adventure.count).to eql(total_adventures + 1)
    expect(user.adventures.count).to eql(user_adventures_count + 1)
    expect(page).to have_content('Your new adventure has been added to this list')
    
    expect(page).to have_content('skydive')
    expect(page).to have_content(bucket_list.title)
  end

  scenario 'User provides no information' do

    total_adventures = Adventure.count
    user_adventures_count = user.adventures.count

    sign_in_as(user)

    visit "/users/#{user.id}/bucket_lists/#{bucket_list.id}/"
  
    click_on 'Add item'
    
    click_on 'Create item!'

    expect(Adventure.count).to eql(total_adventures)
    expect(user.adventures.count).to eql(user_adventures_count)
    
    expect(page).to_not have_content('Your new adventure has been added to this list')
    expect(page).to_not have_content('skydive')
    expect(page).to_not have_content(bucket_list.title)

    expect(page).to have_content("can't be blank") 
  end
  
  scenario 'User cancels making a new adventure' do

    visit "/users/#{user.id}/bucket_lists/#{bucket_list.id}/"
    
    click_on 'Add item'
    click_on 'Cancel'


    expect(page).to have_content(bucket_list.title)

    expect(page).to_not have_content('Your new adventure has been added to this list')
  end
end
