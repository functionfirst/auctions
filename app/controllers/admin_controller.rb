class AdminController < ApplicationController
  before_action :authorised?

  private
  def authorised?
    true
    # unless current_user.has_role? :admin
    #   flash[:error] = "You're not authorised to view that page"
    #   redirect_to root_path
    # end
  end
end
