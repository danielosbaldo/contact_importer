FactoryBot.define do
  factory :contact_file do
    association :user
    file_name { 'test_contacts.csv' }
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_contacts.csv'), 'text/csv') }
  end
end
