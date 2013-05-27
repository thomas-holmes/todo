class ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists.select { |l| !l.new_record? }
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(params[:list])
    @list.save
    respond_to do |format|
      format.html { redirect_to :lists }
      format.js
    end
  end

  def show
    redirect_to list_tasks_url list_id: params[:id]
  end

  def destroy
    @list = current_user.lists.find(params[:id]).delete
    respond_to do |format|
      format.js
    end
  end

  def sort
    render nothing: true
    params[:list].each_with_index do |id, index|
      List.update_all({position: index+1}, {id: id})
    end
  end
end
