class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  before_action :set_fields, only: [:new, :edit]
  authorize_resource

  def index
    respond_with @wikis = Wiki.all
  end

  def show
    respond_with @wiki
  end

  def new
    respond_with @wiki = Wiki.new
  end

  def create
    respond_with(@wiki = Wiki.create(wiki_params))
  end

  def edit; end

  def update
    @wiki.update(wiki_params)
    respond_with @wiki
  end

  def destroy
    respond_with @wiki.destroy
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  def set_fields
    @fields = Field.all
  end

  def wiki_params
    params.require(:wiki).permit(:field_id, :name, :body)
  end
end
