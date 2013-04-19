require 'spec_helper'

describe "Task pages" do
  subject { page }

  describe "no tasks" do
    describe "/tasks" do
      before { visit '/tasks' }

      it { should have_selector('h1', text: "Tasks") }
      it { should_not have_selector('li') }
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

