module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).not_to have_content "Not Found"

    # flash = find("#flash")
    # flash_text = flash.text(:all)

    # flash_text.should == "You are now signed in."

  end
end
