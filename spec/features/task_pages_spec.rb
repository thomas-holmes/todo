require 'spec_helper'

describe "Task pages" do
  before(:each) do
    visit new_user_session_path
    @user = FactoryGirl.create(:user)
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Sign in'
  end
  
  describe "input form" do
    before { visit '/tasks' }

    describe "with valid information" do
      before(:each) do
        page.fill_in "task_description", with: "Lorem ipsum"
        page.select "low", from: "task_importance"
      end

      it "should create a micropost" do
        expect { click_on "commit"}.to change(Task, :count).by(1)
      end
    end

  end

  describe "no tasks" do
    describe "/tasks" do
      before { visit '/tasks' }

      it { page.should have_selector('h1', text: "Tasks") }
    end
  end

  describe "one task" do
    before { @task = FactoryGirl.create(:task, user: @user) }
    describe "/tasks" do
      before { visit '/tasks' }

      it { page.should have_selector('li', text: @task.description) }
    end
  end

  describe "multiple tasks" do
    before do
      10.times { FactoryGirl.create(:task, user: @user) } # this will create several of each importance
      visit '/tasks'
    end

    it { page.should have_selector('h4', text: "low") }
    it { page.should have_selector('h4', text: "medium") }
    it { page.should have_selector('h4', text: "high") }
  end
end

