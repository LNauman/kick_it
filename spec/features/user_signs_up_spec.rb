require 'spec_helper'

feature "user signs up for an account", %Q{
  As an visitor
  I want to create an account
  So I can create new bucket lists and browse others
} do
  # Acceptance Criteria

  # * I must be able to create account with my email address 
  # * I must be able to create a password
  # * I must be able to make a username
 
  scenario 'specifies information, creates an account' do 
    visit new_user_registration_path

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "surprise!"
    fill_in "Password confirmation", with: "surprise!"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end
