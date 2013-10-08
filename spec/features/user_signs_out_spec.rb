require 'spec_helper'

feature 'user signs out', %Q{
  As a user
  I want to sign out
  So that I can end my session
} do

# Acceptance Criteria: 

# * I must click sign out
# * I must be notified I've signed out successfully
# * I must be redirected to the sign in page

  let(:user) {FactoryGirl.create(:user)}
  scenario 'click on sign out, logged out of account' do
    
    visit root_path
    click_link 'Sign in'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Sign in'
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Sign in')

    expect(page).to_not have_content('Sign Out')
  
  end
end
