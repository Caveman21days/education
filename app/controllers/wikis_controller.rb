class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  before_action :set_fields, only: [:new, :create, :edit, :update]
  before_action :set_wikiable, only: [:new, :create, :edit, :update]
  authorize_resource

  def index
    respond_with @wikis = Wiki.all
  end

  def show
    respond_with @wiki
  end

  def new
    respond_with @wiki = @wikiable.wikis.new
  end

  def create
    respond_with(@wiki = @wikiable.wikis.create(wiki_params))
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


  def set_wikiable
    @wikiable = wikiable_object
  end

  def set_fields
    @fields = Field.all
  end

  def wiki_params
    params.require(:wiki).permit(:field_id, :name, :body)
  end

  def wikiable_object
    if params[:project_id]
      Project.find(params[:project_id])
    elsif params[:course_id]
      Course.find(params[:course_id])
    end
  end
end
