FactoryGirl.define do
  factory :bucket_list do
    title 'Awesome'
    category 'Life'
    user_id 1
  
    factory :bucket_list_with_adventures
      after(:create) do |bucket_list|
        FactoryGirl.create_list(:adventure, 1, bucket_list: bucket_list )
    end 
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    username "lnaunau"
    picture Rack::Test::UploadedFile.new(File.open(File.join( Rails.root, 'spec/support/images/stevie-nick.jpg')))
  end

end

FactoryGirl.define do
  factory :adventure do
    sequence(:adventure_description) {|n|"skydive! #{n}"}
  end
end
