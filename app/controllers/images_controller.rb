class ImagesController < ApplicationController
before_action :set_image, only: [:edit, :update, :destroy]
  
  
  def new
    @image = Image.new
  end

  
  def edit
  end

  
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @image.update(images_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end


  private
  
    def set_images
      @image = Image.find(params[:id])
    end

  
    def image_params
      params.require(:image).permit(:product_photo, :product_id, :main)
    end
end
