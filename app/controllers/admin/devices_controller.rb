class Admin::DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all.order(:name)
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      notice = 'Device was successfully created.' unless params[:device_type_change]

      redirect_to edit_device_url(@device), notice: notice
    else
      render :new
    end
  end

  def update
    if @device.update(device_params)
      notice = 'Device was successfully updated.' unless params[:device_type_change]

      redirect_to edit_device_url(@device), notice: notice
    else
      render :edit
    end
  end

  def destroy
    @device.destroy

    redirect_to devices_url, notice: 'Device was successfully destroyed.'
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :ip_address, :device_type_id).tap do |whitelisted|
     whitelisted[:controls_state] = params[:device][:controls_state]
    end
  end
end
