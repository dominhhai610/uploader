class CommentsController < ApplicationController
	# def index
	# 	@image = Image.find(params[:image_id])
	# 	@comments = @image.comments
	# end

	def create
		@image = Image.find(comment_params[:image_id])
		@comment = Comment.create(comment_params)
		if @comment.save!
			flash[:notice] = "Create succeed"
			redirect_to image_path(@image)
		end
	end


	private
	def comment_params
	  params.require(:comment).permit(:content, :image_id, :user_id)
	end
end
