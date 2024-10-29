class StaticPagesController < ApplicationController
  def home
    # Add Pagination to Collection Navigation
    # @cities = City.page(params[:page]).per(10) # This should now work
    @health_data = HealthData.page(params[:page]).per(10) # This too
    @cities = City.paginate(page: params[:page], per_page: 10)

  end
end

