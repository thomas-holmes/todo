require 'spec_helper'

describe "Task pages" do
  before(:each) do
    visit new_user_session_path
    @user = FactoryGirl.create(:user)
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Sign in'
  end
  let(:list) { FactoryGirl.create(:list, user: @user) }
  
  describe "input form" do
    before { visit list_tasks_url list_id: list.id }

    describe "with valid information" do
      before(:each) do
        page.fill_in "task_description", with: "Lorem ipsum"
      end

      it "should create a micropost" do
        expect { click_on "commit"}.to change(Task, :count).by(1)
      end
    end

  end

  describe "no tasks" do
    describe "/tasks" do
      before { visit list_tasks_url list_id: list }

      it { page.should have_selector('h1', text: "Tasks") }
    end
  end

  describe "one task" do
    before { @task = FactoryGirl.create(:task, list: list) }
    describe "tasks url" do
      before { visit list_tasks_url(list_id: list) }

      it { page.should have_selector('span', text: @task.description) }
    end
  end

  describe "multiple tasks" do
    before do
      10.times { FactoryGirl.create(:task, list: list) }
      visit list_tasks_url(list_id: list)
    end
  end
end

