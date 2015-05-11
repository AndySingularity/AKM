class ForumsController < ApplicationController
  
  # GET
  
  def new
    @forum = Forum.new
  end
  
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find_by_id(params[:id])
    @conversations = @forum.conversations
  end

  def edit
    @forum = Forum.find_by_id(params[:id])
  end
  
  # POST
  
  def create
    Forum.create(inner)
    redirect_to forums_path
  end

  def update
    Forum.find_by_id(params[:id]).update(inner)
    redirect_to forums_path
  end
  
  def destroy
    Forum.find_by_id(params[:id]).destroy
    redirect_to forums_path
  end
  
  private
  
  def inner
    params.require(:forum).permit(:title, :desc)
  end
end
