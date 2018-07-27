class AnswersController < ApplicationController
  before_action :set_topic, only: [:create]
  before_action :set_answer, except: :create
  
  authorize_resource

  respond_to :js


  def create
    respond_with(@answer = current_user.answers.create(answer_params.merge(topic: @topic)))
  end

  def update
    @answer.update(answer_params)
    respond_with @answer
  end

  def destroy
    respond_with(@answer.destroy)
  end


  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file])
  end
end
