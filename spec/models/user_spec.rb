require 'spec_helper'

describe User do
  it { should have_valid(:email).when('lindsay@gmail.com', 'hi@aol.com') }
  it { should_not have_valid(:email).when('', nil, 'hellooo')}   
  it { should have_many :bucket_lists}

  it 'has matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
