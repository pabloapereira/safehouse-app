class LocationsController < ApplicationController
  before_action :get_survivor
  before_action :set_location, only: %i[show update destroy]

  def index
    @location = @survivor.location
  end
  def create
    logger.debug(location_params)
    @location = @survivor.location.build_location(location_params)
    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end
  def show
    render json: @location
  end
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end
  def destroy
    render json: @location.destroy
  end

  private
  def get_survivor
    @survivor = Survivor.find(params[:survivor_id])
  end
  def set_location
    @location = @survivor.location.find(params[:id])
  end
  def location_params
    params.require(:location).permit(:latitude, :longitude, :survivor_id)
  end
end
