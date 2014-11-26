class Admin::ProductsController < AdminController
  before_filter :query_data
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
    @photo = @product.photos.new
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def show
    @product = Product.find_by_id(params[:id])
    @photos = @product.photos.all
  end

  def create
    @product = Product.new(params[:product])
    if @product.save!
      params[:photos]['photo'].each do |a|
        @photo = @product.photos.create!(:photo => a, :product_id => @product.id)
      end
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
      respond_to do |format|
        if @product.update_attributes(params[:product])
          if params[:photos].present?
            params[:photos]['photo'].each do |a|
              @photo = @product.photos.create!(:photo => a, :product_id => @product.id)
            end
          end
          format.html { redirect_to admin_product_path(@product), notice: 'Upload was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  end

  def delete_product
    @product = Product.find(params[:id])
    @photos = Photo.where(product_id: @product.id)
    @photos.each do |photo|
      photo.destroy
    end
    @product.destroy
    redirect_to admin_products_path
  end

  def delete_image
    @photo = Photo.find_by_id(params[:id])
    @photo.destroy
    redirect_to :back
  end

  def update_publish
    product = Product.find(params[:id])
    if product.publish == 'yes'
      product.update_attributes(:publish => 'no')
    else
      product.update_attributes(:publish => 'yes')
    end
    redirect_to admin_products_path
  end

  private

  def query_data
    if params[:lang] == 'en'
      @categories = Category.all.map{ |p| [p.name, p.id]}
    else
      @categories = Category.all.map{ |p| [p.name_vn, p.id]}
    end
  end
end