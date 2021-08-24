FactoryBot.define do
  factory :user do
    email { "email@email.com" }
    password { 'password' }
    avatar { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/zuckerberg.jpeg', 'image/jpeg') }
    username { 'Test' }
    id { 1 }
  end
end