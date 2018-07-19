module UserAnswersHelper
  def answer_color(user_answer)
    if user_answer.status == "На рассмотрении"
      "<p class='text-secondary'> На рассмотрении </p>".html_safe
    elsif user_answer.status == "Принято"
      "<p class='text-success'> Ответ принят </p>".html_safe
    elsif user_answer.status == "Отклонено"
      "<p class='text-danger'> Ответ отклонен </p>".html_safe
    end
  end
  

  def user_answer_mark
    [['Балл', 1], ['Балла', 2], ['Балла', 3], ['Балла', 4], ['Баллов', 5], ['Баллов', 6], ['Баллов', 7], ['Баллов', 8], ['Баллов', 9], ['Баллов', 10]]
  end
end