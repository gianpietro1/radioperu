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
      flash[:notice] = "Comentario guardado."
      @comment.send_update_email
    else
      flash[:error] = "Hubo un error al comentar, por favor inténtalo otra vez."
    end

    respond_with(@comment) do |format|
    format.html {redirect_to @commentable }

  end
 end

 def create_reply
   	@parent_id = params[:parent_id]
   	@commentable = find_commentable
    @comment = @commentable.comments.build(body: params[:body])
    @comment.user_id = current_user.id
    @comment.parent_id = @parent_id
    @comments = @commentable.comments.roots

    if @comment.save
      flash[:notice] = "Respuesta guardada."
		  @comment.send_update_email_reply
	    else
      flash[:error] = "Hubo un error al comentar, por favor inténtalo otra vez."
    end

    respond_with(@comments) do |format|
    format.html {render :partial => "comments/create_reply" }
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
	  params.require(:comment).permit(:body,:parent_id)
	end

	def find_commentable
	  params.each do |name, value|
	  	if params[:parent_id]
	  	  return Comment.find(params[:parent_id]).commentable
	    elsif name =~ /(.+)_id$/
	      return $1.classify.constantize.friendly.find(value)
	    end
	  end
	  nil
	end

end
