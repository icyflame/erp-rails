require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe ViewallController, :type => :controller do
  describe 'Should not get Viewall pages without being signed in' do
    it 'Should not be able to get viewall alumni' do
      get :alumni
      # Will be redirected to the root_path
      expect(response).to have_http_status(302)
    end
    it 'Should not be able to get viewall students' do
      get :students
      # Will be redirected to the root_path
      expect(response).to have_http_status(302)
    end
    it 'Should not be able to get viewall paid alumni' do
      get :paid
      # Will be redirected to the root_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'Should not be able to get viewall pages when signed in as StudentMember' do
    it 'Should not get viewall alumni' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      get :alumni
      expect(response).to have_http_status(302)
    end
    it 'Should not get viewall students' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      get :students
      expect(response).to have_http_status(302)
    end
    it 'Should not get viewall paid alumni' do
      user = FactoryGirl.create :StudentMember
      sign_in user
      get :paid
      expect(response).to have_http_status(302)
    end
  end

  describe 'Should be able to get viewall pages when signed in as Coordinator' do
    it 'Should get viewall alumni' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      get :alumni
      expect(response).to have_http_status(200)
    end
    it 'Should get viewall students' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      get :students
      expect(response).to have_http_status(200)
    end
    it 'Should get viewall paid alumni' do
      user = FactoryGirl.create :Coordinator
      sign_in user
      get :paid
      expect(response).to have_http_status(200)
    end
  end
end
