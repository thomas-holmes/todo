require 'spec_helper'

describe Task do
  let(:task) { FactoryGirl.create(:task) }

  it { should respond_to(:description) }
  it { should respond_to(:importance) }

  describe "#description is nil" do
    before { task.description = nil }
    it { should_not be_valid }
  end

  describe "#importance is nil" do
    before { task.importance = nil }
    it { should_not be_valid }
  end
end
