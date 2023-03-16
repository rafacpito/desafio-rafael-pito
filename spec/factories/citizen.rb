FactoryBot.define do
  factory :citizen, class: Citizen do
    full_name { Faker::Name.name }
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'brands', 'photos', 'photo.jpg')) }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 65) }
    telephone { '5514998376622' }
    cpf { Faker::CPF.numeric }
    cns { '227027724020005' }
    email { Faker::Internet.email }
    status { true }
    
    after(:create) do |citizen|
      create(:address, citizen: citizen)
    end
  end
end