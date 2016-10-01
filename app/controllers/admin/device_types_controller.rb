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

    if @device_type.save
      redirect_to edit_device_type_url(@device_type), notice: 'Device type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @device_type.update(device_type_params)
      redirect_to edit_device_type_url(@device_type), notice: 'Device type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @device_type.destroy

    redirect_to device_types_url, notice: 'Device type was successfully destroyed.'
  end

  private

  def set_device_type
    @device_type = DeviceType.find(params[:id])
  end

  def device_type_params
    params.require(:device_type).permit(
      :name,
      control_items_attributes: [
        :id,
        :kind,
        :name,
        :value,
        :api_endpoint,
        :_destroy
      ]
    )
  end
end
