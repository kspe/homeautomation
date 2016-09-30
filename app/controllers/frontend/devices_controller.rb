class Frontend::DevicesController < ApplicationController
  layout 'frontend'

  before_action :set_device, only: :update

  def index
    @devices = Device.all.order(:name)
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_device
    @device = Device.include(:device_types).find(params[:id])
  end

  def device_params
    params.require(:device).permit().tap do |whitelisted|
     whitelisted[:controls_state] = params[:device][:controls_state]
    end
  end
end
