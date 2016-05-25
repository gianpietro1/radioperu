class CommentsController < ApplicationController

  respond_to :html, :js

	def index
	  @commentable = find_commentable
	  @comments = @commentable.comments
	end

 def create
   	@commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_with(@comment) do |format|
    format.html {redirect_to @commentable }

  end
 end

	def destroy
   	@commentable = find_commentable
   	@comment = Comment.find(params[:id])
	  authorize @comment

	  if @comment.destroy
	   flash[:notice] = "Comment was deleted successfully."
	  else
	   flash[:error] = "There was an error deleting the comment."
	  end

	  respond_with(@comment) do |format|
	    format.html {redirect_to @commentable }
	  end

	end

	private

	def comment_params
	  params.require(:comment).permit(:body)
	end

	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.friendly.find(value)
	    end
	  end
	  nil
	end

end
