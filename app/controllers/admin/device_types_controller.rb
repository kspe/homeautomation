class Admin::DeviceTypesController < ApplicationController
  before_action :set_device_type, only: [:show, :edit, :update, :destroy]

  def index
    @device_types = DeviceType.all.order(:name)
  end

  def new
    @device_type = DeviceType.new
  end

  def create
    @device_type = DeviceType.new(device_type_params)

    respond_to do |format|
      if @device_type.save
        format.html { redirect_to @device_type, notice: 'Device type was successfully created.' }
        format.json { render :show, status: :created, location: @device_type }
      else
        format.html { render :new }
        format.json { render json: @device_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @device_type.update(device_type_params)
        format.html { redirect_to @device_type, notice: 'Device type was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_type }
      else
        format.html { render :edit }
        format.json { render json: @device_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @device_type.destroy
    respond_to do |format|
      format.html { redirect_to device_types_url, notice: 'Device type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_device_type
    @device_type = DeviceType.find(params[:id])
  end

  def device_type_params
    params.require(:device_type).permit(:name, control_items_attributes: [ :id, :kind, :name, :value, :_destroy ])
  end
end
