class SurvivorsController < ApplicationController
  before_action :set_survivor, only: %i[index show create update destroy]

  def index
    @survivor = Survivor.all
  end

  def show
    @survivor = Survivor.find(params[id])
  end

  def new
    @survivor = Survivor.new()
  end

  def create
    @survivor = Survivor.new(survivor_params)

    if @survivor.save
      redirect_to @survivor, notice: 'Survivor was successfully created.'
    else
      render :new
    end
  end

  private

  def survivor_params
    params.require(:survivor).permit(:name, :gender, :is_alive, location_attributes: [:longitude, :latitude], inventory_attributes: [:item_name, :quantity])
  end

end
