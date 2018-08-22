class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  before_action :set_main_field, only: [:new, :create, :index]

  authorize_resource

  def index
    respond_with @fields = @main_field.fields
  end

  def show
    respond_with @field
  end

  def edit; end

  def new
    respond_with @field = @main_field.fields.new
  end

  def create
    respond_with(@field = @main_field.fields.create(field_params))
  end

  def update
    @field.update(field_params)
    respond_with @field
  end

  def destroy
    main_field = @field.main_field
    @field.destroy
    redirect_to main_field
  end


  private

  def set_field
    @field = Field.find(params[:id])
  end

  def set_main_field
    @main_field = MainField.find(params[:main_field_id])
  end

  def field_params
    params.require(:field).permit(:name, :short_description, :description, :curator_id)
  end
end
