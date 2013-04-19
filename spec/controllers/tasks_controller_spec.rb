require 'spec_helper'

describe TasksController do
  describe "GET index" do
    describe "@tasks" do
      before { 10.times { FactoryGirl.create(:task) } }


      it "assigns @tasks" do
        get :index
        assigns(:tasks).should_not be nil
      end
      
      it "groups @tasks by importance" do
        get :index
        puts subject.tasks
        subject.tasks.count.should eq 3
      end
    end


    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end
end
