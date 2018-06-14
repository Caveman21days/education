class FieldsController < ApplicationController

  #Можно писать так
  def index
    @fields = Field.all
  end

  def show
    @fields = Field.find(params[:id])
  end

  #Можно и так, если ничего внутри нет
  def new; end
  
  def create; end
  
  def edit; end
  
  def update; end
  
  def destroy; end
end