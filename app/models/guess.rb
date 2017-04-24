class Guess < ActiveRecord::Base
  validates_presence_of :point, :game_id, :quiz_id
  belongs_to :game
  belongs_to :quiz
end
