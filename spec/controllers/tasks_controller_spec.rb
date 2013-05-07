require 'spec_helper'

describe TasksController do
  describe "GET index" do
    describe "@tasks" do
      describe "with signed in user" do
        let(:user) { FactoryGirl.create(:user) }
        let(:list) { FactoryGirl.create(:list, user: user) }
        before do
          sign_in user
          10.times { FactoryGirl.create(:task, list: list) }
        end


        it "#index assigns instance variables" do
          get :index, list_id: list.id
          assigns(:tasks).should_not be nil
          assigns(:task).should_not be nil
          assigns(:list).should_not be nil
        end
        
        it "should have all tasks" do
          get :index, list_id: list.id
          subject.tasks.count.should eq 10
        end
        it "renders the index template" do
          get :index, list_id: list.id
          response.should render_template("index")
        end
      end
      describe "without signed in user" do
        it "should redirect to sign-in" do
          get :index, list_id: 1
          response.should redirect_to(new_user_session_path)
        end
      end
    end
  end
end
