require 'rails_helper'

RSpec.describe StaticpageController, :type => :controller do
  describe "Static Page Controller tests" do
   it "Get the application homepage successfully" do
     get :index
     expect(response).to be_success
     expect(response).to have_http_status(200)
   end
   it "create the admin users" do
     get :createallusers
     expect(response).to be_success
     expect(response).to have_http_status(201)
   end
 end
end
