require 'spec_helper'

feature "I can visit the new  bucket path from the homepage"  do
  

  scenario "if signed in can see new bucket link" do
    visit new_user_registration_path

    expect(page).to_not have_content('New Bucket List')
    fill_in 'Email',with: "linds@linds.com"
    fill_in "Password",with: "password"
    fill_in "Password confirmation",with: "password"
    click_button "Sign up"
    click_on "New Bucket List"

    expect(current_path).to eql(new_bucket_list_path)
  end



end
