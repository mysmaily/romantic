class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :query_data, :set_locale

  def query_data
    @categories = Category.where(published: true)
  end

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end

  def default_url_options(options={})
    { :lang => I18n.locale }
  end


end
