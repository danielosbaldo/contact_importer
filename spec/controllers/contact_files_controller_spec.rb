require 'rails_helper'

RSpec.describe ContactFilesController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end
