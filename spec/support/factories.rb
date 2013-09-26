FactoryGirl.define do
  factory :bucket_list do
    title 'Awesome'
    category 'Life'
  end

end

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

end
