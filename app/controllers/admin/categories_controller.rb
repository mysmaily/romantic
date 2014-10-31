class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(:name => params[:category][:name], name_vn: params[:category][:name_vn], update_at: Time.now, created_at: Time.now)
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
    @category = Category.find(params[:id])
    @category.update_attributes(:name => params[:category][:name], :name_vn => params[:category][:name_vn], update_at: Time.now)

    redirect_to admin_categories_path
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