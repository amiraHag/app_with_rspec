class Complain < ActiveRecord::Base
  attr_accessible :detail, :solution, :subject, :user_id
  belongs_to :user
  validates_presence_of :user_id
  validates :user_id, presence: true, length: { :maximum => 1  } , numericality: true 
  validates(:subject, presence: true , length: { :maximum => 30 })
  validates(:detail, presence: true , length: { :maximum => 50 })
  validates :solution, presence: true, length: { :maximum => 120  }
end
