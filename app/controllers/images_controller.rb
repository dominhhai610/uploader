class ImagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_image, only: [:destroy, :show]
	def index
		@images = current_user.images
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(image_params)
		if @image.save!
			flash[:notice] = "Create succeed"
			redirect_to images_path
		else
			render :new
		end
	end

	def show
		@comments = @image.comments
		@comment = Comment.new
	end

	def destroy
		@image.destroy

		respond_to do |format|
      format.html { redirect_to images_path, notice: 'image successfully destroyed.' }
      # format.json { head :no_content }
    end
	end

	private
	def image_params
	  params.require(:image).permit(:title, :image, :user_id)
	end

	def set_image
  	@image = Image.find(params[:id])
  end
end
