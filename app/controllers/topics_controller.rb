class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  
  authorize_resource

  def index
    respond_with @topics = Topic.all
  end

  def show
    @answer = Answer.new
    respond_with @topic
  end

  def edit; end

  def new
    respond_with @topic = Topic.new
  end

  def create
    respond_with(@topic = Topic.create(topic_params.merge(author_id: current_user.id)))
  end

  def update
    @topic.update(topic_params)
    respond_with @topic
  end

  def destroy
    respond_with @topic.destroy
  end


  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :section, attachments_attributes: [:file])
  end
end
