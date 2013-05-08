require 'spec_helper'

describe TasksController do
  describe "with signed in user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:list) { FactoryGirl.create(:list, user: user) }
    let(:task) { FactoryGirl.create(:task, list: list) }
    before do
      sign_in user
      10.times { FactoryGirl.create(:task, list: list) }
    end
    describe "#index" do
      it "assigns instance variables" do
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

    describe "#destroy" do
      it "should delete task" do
        delete :destroy, list_id: list.id, id: task.id
        expect { Task.find(task) }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    describe "#create" do
      it "should create new task" do
        post :create, list_id: list, task: { description: "Test Task 99" }
        expect { Task.find_by_description("Test Task 99") }.to_not raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "without signed in user" do
    it "should redirect to sign-in" do
      get :index, list_id: 1
      response.should redirect_to(new_user_session_path)
    end
  end
end
