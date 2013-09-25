FactoryGirl.define do
  factory :bucket_list do
    title 'Awesome'
    category 'Life'
  end

end

FactoryGirl.define do
  factory :user do
    email "email@example.com"
    password "helloooo"
  end

end
