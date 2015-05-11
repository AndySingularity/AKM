class CommentsController < ApplicationController
		
	# GET
	
	def new
		@comment = Comment.new
	end
	
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by_id(params[:id])
	end

	def edit
		@comment = Comment.find_by_id(params[:id])
	end
	
	# POST
	
	def create
		# raise params.inspect	
		Comment.create(inner)
		redirect_to forum_conversation_path(forum_id: params[:forum_id], id: params[:conversation_id])
	end

	def update
		Comment.find_by_id(params[:id]).update(inner)
		redirect_to forum_conversation_path(forum_id: params[:forum_id], id: params[:conversation_id])
	end
	
	def destroy
		Comment.find_by_id(params[:id]).destroy
		redirect_to forum_conversation_path(forum_id: params[:forum_id], id: params[:conversation_id])
	end
	
	private
	
	def inner
		params.require(:comment).permit(:text, :user_id, :conversation_id)
	end
		
end