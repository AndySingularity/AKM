class ConversationsController < ApplicationController

  # GET
  
  def new
    @conversation = Conversation.new
  end
  
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
    @forum = @conversation.forum
    @comments = @conversation.comments.page(params[:page]).per(20)
  end

  def edit
    @conversation = Conversation.find_by_id(params[:id])
  end
  
  # POST
  
  def create
    Conversation.create(inner)
    redirect_to forum_path(params[:forum_id])
  end

  def update
    Conversation.find_by_id(params[:id]).update(inner)
    redirect_to forum_path(params[:forum_id])
  end
  
  def destroy
    Conversation.find_by_id(params[:id]).destroy
    redirect_to forum_path(params[:forum_id])
  end
  
  private
  
  def inner
    params.require(:conversation).permit(:title, :forum_id)
  end
end
