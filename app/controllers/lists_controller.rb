class ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists.select { |l| !l.new_record? }
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(params[:list])
    @list.save
  end

  def show
    redirect_to list_tasks_url list_id: params[:id]
  end

  def destroy
    @list = current_user.lists.find(params[:id]).delete
  end
end
