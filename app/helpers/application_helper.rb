module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      if language.nil?
        Pygments.highlight(code, lexer: "HTML")
      else
        Pygments.highlight(code, lexer: Pygments.lexers.has_key?(language.classify) ? language : "HTML")
      end
    end
  end

  def markdown(text)
    options = { hard_wrap: true, filter_html: true, autolink: true, no_intra_emphasis: true, quote: true, fenced_code_blocks: true }
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, options)
    markdown.render(text).html_safe
  end

  def description_preview(text)
    "#{text[0..100]}..."
  end

  def assignmentable_link(object)
    object.class.name.downcase
    "/#{object.class.name.downcase}s/#{object.id}/user_assignments/new"
  end

  def issuable_link(object)
    object.class.name.downcase
    "/#{object.class.name.downcase}s/#{object.id}/issues/new"
  end

  def assignmentable_users(object)
    case object.class.name
    when "Field"
      User.all
    when "Course", "Project"
      # object.field.users
      User.all
    when "Issue"
      object.issuable.users
    end
  end

  def assignmentable_roles(object)
    case object.class.name
    when "Field", "Course", "Project"
      Role.all
    when "Issue"
      Role.where(name: ["Исполнитель", "Наблюдатель"])
    end
  end

  def field_topics
    @field_with_names = Field.pluck(:id, :name)
  end
end
