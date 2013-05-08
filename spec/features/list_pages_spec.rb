require 'spec_helper'

describe "List pages" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
  end

  describe "with signed in user" do
    let!(:list) { FactoryGirl.create(:list, user: user) }
    before(:each) { visit lists_path list }

    describe "index" do
      it "should have user name" do
        expect(page).to have_selector('h1', text: 'Lists')
      end 
    end
  end
end
