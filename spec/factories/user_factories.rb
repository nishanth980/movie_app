FactoryBot.define do
  factory :user, class: 'User' do
    email {'test@yopmail.com'}
    password {'123456'}
    password_confirmation {'123456'}
  end
end