class TasksController < ApplicationController
  before_filter :authenticate_user!
  attr_reader :tasks

  def index
    @list = current_user.lists.find(params[:list_id])
    @tasks = @list.tasks.select { |t| !t.new_record? }
    @task = @list.tasks.build
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.build(params[:task])
    @task.save
    respond_to do |format|
      format.html { redirect_to list_tasks_url list_id: @list.id }
      format.js
    end
  end

  def destroy
    render nothing: true
    @task = current_user.lists.find(params[:list_id]).tasks.find(params[:id]).delete
  end

  def sort
    render nothing: true
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
  end
end
