class Question < ActiveRecord::Base

  validates :goal_id, :presence => true
  validates :question_text, :presence => true, :uniqueness => {:scope => :goal_id}
  validates :cadence, :presence => true

  has_many :answers
  belongs_to :goal

end
