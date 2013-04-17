require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "assigns @tasks" do
      task = FactoryGirl.create(:task)
      get :index
      assigns(:tasks).should eq [task]
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end
end
