require 'rails_helper'

RSpec.describe AllotmentController, :type => :controller do

  describe "GET allot" do
    it "returns http success" do
      get :allot
      expect(response).to be_success
    end
  end

end
