class TasksController < ApplicationController
  attr_reader :tasks

  def index
    @tasks = Task.all.group_by(&:importance)
  end
end
