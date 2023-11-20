class LocationsController < ApplicationController
  # before_action :get_survivor
  before_action :set_location, only: %i[show update destroy]

  def index
    if params[:survivor_id]
      @survivor = Survivor.find(params[:survivor_id])
      # binding.pry
      @locations = @survivor.locations
    else
      @locations = Location.all
    end

    render json: @locations
  end
  def create
    logger.debug(location_params)
    @location = @survivor.build_location(location_params)
    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: { error: "Error trying to Create a Location", details: @location.errors, params: location_params }, status: :unprocessable_entity
    end
  end
  def show
    render json: @location
  end
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: { error: "Error trying to update a Location", details: @location.errors, params: location_params }, status: :unprocessable_entity
    end
  end
  def destroy
    render json: @location.destroy
  end

  private
  # def get_survivor
  #   @survivor = Survivor.find(params[:survivor_id])
  # end
  def set_location
    @location = @survivor.locations.find(params[:id])
  end
  def location_params
    params.require(:location).permit(:latitude, :longitude, :survivor_id)
  end
end
