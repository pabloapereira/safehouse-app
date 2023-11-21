class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[show update destroy]

  def index
    @survivors = Survivor.all

    render json: @survivors
  end
  def create
    @survivor = Survivor.new(survivor_params)
    
    if @survivor.save
      location = @survivor.locations.build(location_params)
      location.save
      @survivor.update(location_id: location.id)

      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end
  def show
    render json: @survivor
  end
  def update
    basic_params = {
      name: params[:survivor][:name],
      age: params[:survivor][:age],
      gender: params[:survivor][:gender],
      is_alive: params[:survivor][:is_alive]
    }

    if @survivor.update(survivor_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end
  def destroy
    render json: @survivor.destroy
  end

  private

  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  def survivor_params
    params.require(:survivor).permit(base_survivor_attributes)
  end
  
  def location_params
    params.require(:survivor).permit(:longitude, :latitude)
  end
  
  def base_survivor_attributes
    [:name, :gender, :age, :is_alive]
  end

end