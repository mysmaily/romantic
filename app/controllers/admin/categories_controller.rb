class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end
  def new
  end

  def set_published
    @category = Category.find(params[:id])
    published = params[:published] == "true" ? true : false
    @category.update_column :published, published
    render nothing: true
    binding.pry
  end

end