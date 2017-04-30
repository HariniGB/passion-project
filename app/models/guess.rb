class Guess < ActiveRecord::Base
  validates_presence_of :point, :game_id, :quiz_id, :guess_body
  belongs_to :game
  belongs_to :quiz
  has_one :topic, through: :quiz


  def correct_guess(quiz)
    if self.guess_body == quiz.answer
      return true
    else
      return false
    end
  end

  def update_point(quiz)
    if self.correct_guess(quiz)
      self.point = quiz.weight
    else
      self.point = 0
    end
  end
end
