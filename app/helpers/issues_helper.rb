module IssuesHelper
  def progress
    [['0%', 0], ['10%', 10], ['20%', 20], ['30%', 30], ['40%', 40], ['50%', 50], ['60%', 60], ['70%', 70], ['80%', 80], ['90%', 90], ['100%', 100]]
  end

  def state
    ['Выполнено', 'В работе', 'Отложено', 'Просрочено']
  end

  def user_issue
    UserAssignment.where(assignmentable_id: @issue.id, assignmentable_type: @issue.class.name).first
  end

end
