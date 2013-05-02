require 'spec_helper'

describe ListsController do
  describe "with signed in user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      10.times { FactoryGirl.create(:list, user: user) }
    end

    it "#index assigns @lists" do
      get :index
      assigns(:lists).should_not be nil
    end
  end
end
