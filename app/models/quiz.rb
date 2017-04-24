class Quiz < ActiveRecord::Base
  validates_presence_of :question, :answer, :weight, :topic_id
  has_many  :options
  belongs_to :topic
end
