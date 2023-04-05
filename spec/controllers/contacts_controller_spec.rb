require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:contact_file) { build(:contact_file) }
    let(:file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "test_contacts.csv"), "text/csv") }

    it "creates a new ContactFile" do
      expect {
        post :create, params: { contact_file: { file_name: contact_file.file_name, file: file } }
      }.to change(ContactFile, :count).by(1)
    end

    # Add more tests for different scenarios, like invalid file or invalid mappings
  end
end
