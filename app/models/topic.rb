class Topic < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :answers

  has_many :attachments, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank



  def self.topic_sections
    topics = ["Вопросы администратору", 'Разговоры'] + Field.pluck(:name)
    @topic_sections = []

    for i in 0...topics.count do
      @topic_sections << [i, topics[i]]
    end
    @topic_sections
  end
end
