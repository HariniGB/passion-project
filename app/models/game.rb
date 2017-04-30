class Game < ActiveRecord::Base
  validates_presence_of :user_id

  belongs_to :user
  has_many :guesses
  has_many :quizzes, through: :guesses

  def total_questions
    self.guesses.count
  end

  def score
    self.score = self.guesses.sum(:point)
  end

  def list_of_wrong_questions
    wrong_questions = []
    list = self.guesses
    list.each do |guess|
      if point == nil
        wrong_questions << list.question
      end
    end
    wrong_questions
  end

  def highest_score
    games = Game.all.sort_by(&:score).reverse
    games.first #This will have a game object with the user_id and highest score
  end

end
