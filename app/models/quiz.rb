class Quiz < ActiveRecord::Base
  validates_presence_of :question, :answer, :weight, :topic_id
  has_many  :options
  has_many :guesses
  belongs_to :topic
end
