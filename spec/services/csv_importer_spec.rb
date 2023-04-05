require 'rails_helper'

RSpec.describe CsvImporter, type: :service do
  let(:user) { create(:user) }
  let(:contact_file) { create(:contact_file, user: user) }
  let(:csv_importer) { CsvImporter.new(user, contact_file.file) }

  it "imports contacts from CSV" do
    expect { csv_importer.import }.to change(user.contacts, :count).by(7) #there are 7 contacts in the CSV file
  end

end
