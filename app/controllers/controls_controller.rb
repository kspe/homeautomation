class ControlsController < ApplicationController
  before_action :set_control, only: [:show, :edit, :update, :destroy]

  def index
    @controls = Control.all.order(:kind)
  end

  def new
    @control = Control.new
  end

  def create
    @control = Control.new(control_params)

    respond_to do |format|
      if @control.save
        format.html { redirect_to @control, notice: 'Control was successfully created.' }
        format.json { render :show, status: :created, location: @control }
      else
        format.html { render :new }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @control.update(control_params)
        format.html { redirect_to @control, notice: 'Control was successfully updated.' }
        format.json { render :show, status: :ok, location: @control }
      else
        format.html { render :edit }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @control.destroy
    respond_to do |format|
      format.html { redirect_to controls_url, notice: 'Control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_control
    @control = Control.find(params[:id])
  end

  def control_params
    params.require(:control).permit(:kind, :name, :value)
  end
end
