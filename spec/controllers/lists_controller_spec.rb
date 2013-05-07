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

    it "#show should redirect" do
      id = user.lists.first.id
      puts(id)
      get 'show', { id: id }
      expect(response).to redirect_to(list_tasks_url list_id: id )
    end

    it "#create should create new list" do
      post 'create', title: "test list"
      assigns(:list).should_not be nil
    end
  end
end
