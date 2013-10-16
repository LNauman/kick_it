require 'spec_helper'

feature "user searches usernames", %Q{
  As a user
  I want to be able to search usernames
  So that I can find the profile for who I'm looking for
} do
  
  # Acceptance Criteria:

  # * I must be able to type a username into a search bar
  # * I must be able to see a list of that users and other similar matches



  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  scenario 'type a username in the search bar, find specific user' do
    visit users_path

    fill_in 'Username', with: user1.username
    click_on 'Search'

    expect(page).to have_content(user1.username)
    expect(page).to_not have_content(user2.username)
  end

  scenario 'types in a user that does not exist' do
    visit users_path

    fill_in 'Username', with: "boo"
    click_on 'Search'

    expect(page).to have_content("That user does not exist!")
    expect(page).to_not have_content("boo")
  end
end
