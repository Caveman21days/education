class NotificationsController < ApplicationController
  # authorize_resource
  skip_authorization_check

  def index
    @issues = UserAssignment.where(issue_state: 'Открыта', user_id: current_user.id)
    @user_answers = UserAnswer.where(status: 'На рассмотрении', recipient_id: current_user.id)
    respond_with @notifications = [@issues, @user_answers]
  end
end