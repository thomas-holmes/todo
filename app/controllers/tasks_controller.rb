class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_reader :tasks

  def index
    @tasks = current_user.lists.tasks.order("position").select { |t| !t.id.nil? }
    @task = current_user.tasks.build
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.build(params[:task])
    @task.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def destroy
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id]).delete
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
  end
end
