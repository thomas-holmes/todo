class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_reader :tasks

  def index
    @tasks = current_user.tasks.group_by(&:importance)
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:secondary] = "Wow! You added a task!"
    end
    redirect_to action: 'index'
  end
end
