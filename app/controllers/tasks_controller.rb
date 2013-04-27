class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_reader :tasks

  def index
    @tasks = current_user.tasks.group_by(&:importance)
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(params[:task])
    @task.save
    respond_to do |format|
      format.html { redirect_to action: 'index' }
      format.js
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def destroy
    @task = current_user.tasks.find(params[:id]).delete
  end
end
