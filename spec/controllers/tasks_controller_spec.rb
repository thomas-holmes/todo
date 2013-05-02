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


        it "assigns @tasks" do
          get :index
          assigns(:tasks).should_not be nil
        end
        
        it "should have all tasks" do
          get :index
          subject.tasks.count.should eq 10
        end
        it "renders the index template" do
          get :index
          response.should render_template("index")
        end
      end
      describe "without signed in user" do
        it "should redirect to sign-in" do
          get :index
          response.should redirect_to(new_user_session_path)
        end
      end
    end
  end
end
