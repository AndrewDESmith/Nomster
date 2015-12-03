FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "omg#{n}@email.com"
    end
    password "password"
  end

  factory :place do
    name 'omg cafe'
    address '123 omg lane'
    description 'omg this is so good!'
    association :user
  end
end
