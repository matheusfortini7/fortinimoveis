class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @pagy, @properties = pagy(Property.order(created_at: :desc))

    if params[:query].present?
      sql_query = "address ILIKE :query"
      @properties = @properties.where(sql_query, query: "%#{params[:query]}%")
    else
      @properties
    end
  end

  def my_properties
    @properties = Property.where(user_id: current_user.id)

    if params[:query].present?
      @properties = @properties.where(id: params[:query])
    else
      @properties
    end
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
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
    redirect_to my_properties_properties_path
  end

  private

  def property_params
    params.require(:property).permit(
      :title, :description, :address, :bathrooms, :area, :rooms, :suites,
      :parking_space, :furnished, :condominium, :iptu, :price, :building,
      :status, photos: []
    )
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
