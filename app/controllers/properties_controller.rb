class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  def edit
  end

  def update
    @property.update(property_params)
    redirect_to @property
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(
      :title, :description, :address, :bathrooms, :area, :rooms, :suites,
      :parking_space, :furnished, :condominium, :iptu, :price, :building,
      :status
    )
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
