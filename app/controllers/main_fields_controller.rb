class MainFieldsController < ApplicationController
  before_action :set_main_field, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    respond_with @main_fields = MainField.all
  end

  def show
    respond_with @main_field
  end

  def edit; end

  def new
    respond_with @main_field = MainField.new
  end

  def create
    respond_with(@main_field = MainField.create(main_field_params))
  end

  def update
    @main_field.update(main_field_params)
    respond_with @main_field
  end

  def destroy
    respond_with @main_field.destroy
  end


  private

  def set_main_field
    @main_field = MainField.find(params[:id])
  end

  def main_field_params
    params.require(:main_field).permit(:name, :short_description, :description)
  end
end
