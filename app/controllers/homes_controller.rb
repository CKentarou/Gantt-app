class HomesController < ApplicationController
  def top
    if user_signed_in?
      @projects = current_user.projects
    end
  end

  def about
  end
end
