class Admin::ProductsController < AdminController

  def new
    @category = Category.new
  end

end