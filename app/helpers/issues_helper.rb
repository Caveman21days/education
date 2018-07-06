module IssuesHelper
  def answer_color
    if self.status == "На рассмотении"
      "<p class='text-secondary'>  asd </p>"
    end
  end
end