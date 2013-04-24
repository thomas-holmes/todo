class TasksController < ApplicationController
  attr_reader :tasks

  def index
    @tasks = Task.all.group_by(&:importance)
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:secondary] = "Wow! You added a task!"
    end
    redirect_to action: 'index'
  end
end
