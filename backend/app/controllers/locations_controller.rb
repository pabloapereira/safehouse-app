class LocationsController < ApplicationController
  before_action :get_survivor
  before_action :set_location, only: %i[show update destroy]

  def index
    if params[:survivor_id]
      @locations = @survivor.locations
    else
      @locations = Location.all
    end

    render json: @locations
  end
  def create
    @location = @survivor.locations.build(location_params)
    # binding.pry
    if @location.save
      render json: @location, status: :created
    else
      render json: { error: "Error trying to Create a Location", details: @location.errors, params: location_params }, status: :unprocessable_entity
    end
  end
  def full_survivor
    all_survivor_data = []
  
    Survivor.all.each do |survivor|
      survivor_last_location = survivor.locations.last
  
      survivor_data = {
        name: survivor.name,
        age: survivor.age,
        gender: survivor.gender,
        is_alive: survivor.is_alive,
        longitude: survivor_last_location&.longitude,
        latitude: survivor_last_location&.latitude
      }
  
      all_survivor_data << survivor_data
    end
  
    render json: all_survivor_data
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
  def get_survivor
    @survivor = Survivor.find(params[:survivor_id])
  end
  def set_location
    @location = @survivor.locations.find(params[:id])
  end
  def location_params
    params.require(:location).permit(:latitude, :longitude, :survivor_id)
  end
end
