class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    @property.the_nearest_stations.build
  end

  def edit
    if @property.the_nearest_stations.last.station_name.present?
      @property.the_nearest_stations.build
    end
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: '物件が登録されました。' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: '物件の登録内容を編集しました。' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: '物件を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :notes, the_nearest_stations_attributes: [:id, :line_name, :station_name, :minuites_on_foot])
  end
end
