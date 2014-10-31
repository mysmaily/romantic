class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
    if params[:lang] == 'en'
      @categories = Category.all.map{ |p| [p.name, p.id]}
    else
      @categories = Category.all.map{ |p| [p.name_vn, p.id]}
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
    if params[:lang] == 'en'
      @categories = Category.all.map{ |p| [p.name, p.id]}
    else
      @categories = Category.all.map{ |p| [p.name_vn, p.id]}
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def create
    @product = Product.new(title: params[:product][:title],
                           title_vn: params[:product][:title_vn],
                           description: params[:product][:description],
                           price: params[:product][:price],
                           percent_sale: params[:product][:percent_sale],
                           image: params[:product][:image],
                           publish: params[:product][:publish],
                           category_id: params[:product][:category_id])
    if @product.save!
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
    @product.update_attributes(title: params[:product][:title],
                               title_vn: params[:product][:title_vn],
                               description: params[:product][:description],
                               price: params[:product][:price],
                               percent_sale: params[:product][:percent_sale],
                               image: params[:product][:image],
                               publish: params[:product][:publish],
                               category_id: params[:product][:category_id])
    redirect_to admin_products_path
  end

  def delete_product
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

end