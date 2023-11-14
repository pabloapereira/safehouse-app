class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[show create update destroy]

  def index
    @survivor = Survivor.all

    render json: @survivor
  end

  def show
    render json: @survivor
  end

  def create
    @survivor = Survivor.new(survivor_params)

    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @survivor.update(survivor_params)
      render json: @usuario
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @usuario.destroy
  end

  private

  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  def survivor_params
    params.require(:survivor).permit(:name, :gender, :is_alive, location_attributes: [:longitude, :latitude], inventory_attributes: [:item_name, :quantity])
  end

end
