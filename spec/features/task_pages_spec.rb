require 'spec_helper'

describe "Task pages" do
  subject { page }
  
  describe "input form" do
    before { visit '/tasks' }
    #it { should have_selector('input') }

    describe "with valid information" do
      before do
        fill_in "task_description", with: "Lorem ipsum"
        select "low", from: "task_importance"
      end

      it "should create a micropost" do
        expect { click_on "commit"}.to change(Task, :count).by(1)
      end
    end

  end

  describe "no tasks" do
    describe "/tasks" do
      before { visit '/tasks' }

      it { should have_selector('h1', text: "Tasks") }
    end
  end

  describe "one task" do
    before { @task = FactoryGirl.create(:task) }
    describe "/tasks" do
      before { visit '/tasks' }

      it { should have_selector('li', text: @task.description) }
    end
  end

  describe "multiple tasks" do
    before do
      10.times { FactoryGirl.create(:task) } # this will create several of each importance
      visit '/tasks'
    end

    it { should have_selector('h4', text: "low") }
    it { should have_selector('h4', text: "medium") }
    it { should have_selector('h4', text: "high") }
  end
end

