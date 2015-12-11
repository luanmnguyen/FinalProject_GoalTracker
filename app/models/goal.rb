class Goal < ActiveRecord::Base

  validates :user_id, :presence => true
  validates :goal_text, :presence => true, :uniqueness => {:scope => :user_id}

  has_many :questions
  has_many :answers, :through => :questions
  belongs_to :user

end
