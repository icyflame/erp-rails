require 'rails_helper'

RSpec.describe SponsorsController, :type => :controller do

  describe 'Sponsors page should not be accessible when not signed in' do
    it 'Show all sponsors should not be accessible' do
      get :show
      expect(response).to have_http_status(302)
    end
    it 'View one sponsor should not be accessible' do
      spons = FactoryGirl.create :Sponsor
      spons.save!
      get :view, :id => "1"
      expect(response).to have_http_status(302)
    end
  end

  describe 'Sponsors page should be accessible when signed in as StudentMember' do
    it 'Show all sponsors should be accessible' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      get :show
      expect(response).to have_http_status(200)
    end
    it 'View one sponsor should be accessible' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      spons = FactoryGirl.create :Sponsor
      spons.save!
      get :view, :id => "1"
      expect(response).to have_http_status(200)
    end
  end


  describe 'Sponsors page should be accessible when signed in as Coordinator' do
    it 'Show all sponsors should be accessible' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      get :show
      expect(response).to have_http_status(200)
    end
    it 'View one sponsor should be accessible' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      spons = FactoryGirl.create :Sponsor
      spons.save!
      get :view, :id => "1"
      expect(response).to have_http_status(200)
    end
  end
end
