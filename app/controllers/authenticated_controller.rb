class AuthenticatedController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :authenticate_user!, :verify_is_admin

  private
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.role == 'admin')
  end
end