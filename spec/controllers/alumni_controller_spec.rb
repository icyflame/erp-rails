require 'rails_helper'

RSpec.describe AlumniController, :type => :controller do
  describe 'Should not get alumni details when not signed in' do
    it 'Should not get alumni details' do
      alumni = FactoryGirl.create :Alumni
      alumni.save!
      get :show, :id => alumni.id
      expect(response).to have_http_status(302)
    end
  end
  describe 'Should get alumni details when signed in as Studentmember' do
    it 'Should get alumni details' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      alumni = FactoryGirl.create :Alumni
      alumni.save!
      get :show, :id => alumni.id
      expect(response).to have_http_status(200)
    end
  end
  describe 'Should get alumni details when signed in as Coordinator' do
    it 'Should get alumni details' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      alumni = FactoryGirl.create :Alumni
      alumni.save!
      get :show, :id => alumni.id
      expect(response).to have_http_status(200)
    end
  end
end
