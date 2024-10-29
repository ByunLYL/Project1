class StaticPagesController < ApplicationController
  def home
    # Add Pagination to Collection Navigation
    @cities = City.paginate(page: params[:page], per_page: 10)

    @health_data = HealthData.page(params[:page]).per(10)


  end
end

