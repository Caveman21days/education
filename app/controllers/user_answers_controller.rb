class UserAnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: [:create]
  before_action :set_user_answer, except: :create

  authorize_resource

  respond_to :js

  def create
    respond_with(@user_answer = current_user.user_answers.create(user_answer_params.merge(recipient_id: @issue.author_id, issue_id: @issue.id, status: "На рассмотрении")))
  end

  def update
    @user_answer.update(user_answer_params)
    respond_with @user_answer, notice: "Ваш ответ успешно изменен!"
  end

  def destroy
    respond_with(@user_answer.destroy)
  end

  def accept_user_answer
    @user_answer.update(status: "Принято")
    redirect_to @user_answer.issue
  end

  def reject_user_answer
    @user_answer.update(status: "Отклонено")
    redirect_to @user_answer.issue
  end


  private

  def set_user_answer
    @user_answer = UserAnswer.find(params[:id])
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def user_answer_params
    params.require(:user_answer).permit(:body)
  end
end
