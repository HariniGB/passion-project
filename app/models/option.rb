class Option < ActiveRecord::Base
  validates_presence_of :option, :quiz_id

  belongs_to :quiz
end
