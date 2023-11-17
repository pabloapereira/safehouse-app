class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[show update destroy]

  def index
    @survivors = Survivor.all

    render json: @survivors
  end
  def create
    @survivor = Survivor.new(survivor_params)
    @survivor.build_location

    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end
  def show
    render json: @survivor
  end
  def update
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
    params.require(:survivor).permit(:name, :gender, :is_alive, location_attributes: [:longitude, :latitude], inventory_attributes: [:item_name, :quantity])
  end

end
