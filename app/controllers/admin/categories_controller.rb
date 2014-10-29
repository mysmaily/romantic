class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    @category = Category.new
    if @category.save!
      redirect_to admin_categories_path
    else
      redirect_to admin_home_index_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
  end

  def delete_category
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  def set_published
    @category = Category.find(params[:id])
    published = params[:published] == "true" ? true : false
    @category.update_column :published, published
    render nothing: true
  end

end