FactoryGirl.define do
  factory :user do
    sequence(:name)     { |n| "Person #{n}" }
    sequence(:email)    { |n| "person_#{n}@example.com" }
    password "rahasia"
    password_confirmation "rahasia"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    # content "Lorem ipsum"
    sequence(:content) { |n| "Lorem ipsum #{n}" }
    user
  end
end