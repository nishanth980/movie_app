class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to admin_home_index_path if current_user.admin?
    @movies = Movie.includes(show_times: [:movie, :slot, :screen, :movie_date])
  end

  def admin
  end

end
