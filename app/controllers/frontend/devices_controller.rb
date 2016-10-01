class Frontend::DevicesController < ApplicationController
  layout 'frontend'

  def index
    @devices = Device.all.includes(device_type: :control_items).order(:name)
  end

  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if !@device.update(device_params)
        format.json { render :show, status: :ok, location: @device }
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def device_params
    params.require(:device).permit().tap do |whitelisted|
     whitelisted[:controls_state] = params[:device][:controls_state]
    end
  end
end
