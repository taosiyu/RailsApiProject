require 'rails_helper'

RSpec.describe "Discoveries", type: :request do
  describe "GET /discoveries" do
    it "works! (now write some real specs)" do
      get discoveries_path
      expect(response).to have_http_status(200)
    end
  end
end
