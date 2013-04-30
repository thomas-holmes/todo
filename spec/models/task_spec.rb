require 'spec_helper'

describe Task do
  let(:task) { Task.new }

  it { should respond_to(:description) }

  describe "#description is not" do
    before { task.description = nil }
    it { should_not be_valid }
  end
end
