class Game < ActiveRecord::Base
  validates_presence_of :user_id

  belongs_to :user
  has_many :guesses
  has_many :quizzes, through: :guesses

  def total_questions
    self.guesses.count
  end

  def total_score
    self.score = self.guesses.sum(:point)
  end

  def list_of_wrong_questions
    wrong_questions = []
    list = self.guesses
    list.each do |guess|
      if guess.point == 0
        wrong_questions << guess.quiz.question
      end
    end
    wrong_questions
  end

  def total_correct_questions
    correct_answer = 0
    self.guesses.each do |guess|
      if guess.point != 0
        correct_answer += 1
      end
    end
    correct_answer
  end

  def highest_score
    games = Game.all.sort_by(&:score).reverse
    games.first #This will have a game object with the user_id and highest score
  end

end
