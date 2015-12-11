class Answer < ActiveRecord::Base

  validates :question_id, :presence => true
  validates :questioned_on, :presence => true, :uniqueness => {:scope => :question_id}

  belongs_to :question

end
