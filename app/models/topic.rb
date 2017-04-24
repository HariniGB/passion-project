class Topic < ActiveRecord::Base
  validates_presence_of :topic_name

  has_many :quizzes
end
