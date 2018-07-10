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
end