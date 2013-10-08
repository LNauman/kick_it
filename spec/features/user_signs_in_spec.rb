require 'spec_helper'

feature 'user signs in', %Q{
  As a user 
  I want to sign in
  So that I can access my account
} do
  
  # Acceptance  Criteria:

  # * If I specify a valid, previously registered email and password,
  #   I am authenticated and gain access to the system
  # * If I specify an invalid email and password, I remain unauthenticated
  # * If I am already signed in, I can't sign in again
  
    let(:user) {FactoryGirl.create(:user)}
    scenario 'an existing user specifies a valid email address and password' do
      visit root_path
      click_link 'Sign in'
      
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      # fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign in'

      expect(page).to have_content('Welcome back!')
      expect(page).to have_content('Sign out')

      expect(page).to_not have_content('Sign in')
      expect(page).to_not have_content('Sign up')

      

    end

    scenario 'a non-existant email and password are supplied' do 
      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: 'nobody@example.com'
      fill_in 'Password', with: 'password'
      
      click_button 'Sign in'

      expect(page).to have_content('Invalid email or password.')
      
      expect(page).to_not have_content('Welcome back!')
      expect(page).to_not have_content('Sign out')
    
    end

    scenario 'an existing email with the wrong password is denied' do
      user = FactoryGirl.create(:user)
      visit root_path
      
      click_link 'Sign in'
      
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'incorrectpassword'
      
      click_button 'Sign in'

      expect(page).to have_content('Invalid email or password.')
      expect(page).to_not have_content('Sign out')
    
    end

    scenario 'an already authenticated user cannot re-sign in' do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      
      click_button 'Sign in'

      expect(page).to have_content('Sign out')
      expect(page).to_not have_content('Sign in')

      visit new_user_session_path

      expect(page).to have_content('You are already signed in.')
    
    end
end
