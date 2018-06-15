class FieldsController < ApplicationController
  before_action set_field, only: [:show, :edit, :update, :destroy]


  def index
    respond_with @fields = Field.all
  end

  def show; end

  def edit; end

  def new
    respond_with @field = Field.new
  end

  def create
    respond_with(@field = Field.create(field_params))
  end

  def update
    @field.update(field_params)
    respond_with @field
  end

  def destroy
    respond_with @field.destroy
  end


  private

  def set_field
    @field = Field.find(params[:id])
  end

  def field_params
    params.require(:field).permit(:name, :description, :curator_id)
  end
end