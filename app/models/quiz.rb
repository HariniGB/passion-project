class Quiz < ActiveRecord::Base
  validates_presence_of :question, :answer, :weight, :topic_id
  has_many  :options
  has_many :guesses
  belongs_to :topic

  def next_quiz
    next_quiz_id = self.id + 1
    next_quiz = Quiz.find(next_quiz_id)
    if next_quiz && next_quiz.topic_id == self.topic_id
      next_quiz
    else
      nil
    end
  end

end
