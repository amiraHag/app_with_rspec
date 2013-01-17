class Car < ActiveRecord::Base
  attr_accessible :carmodel, :cartype, :myear, :price, :user_id, :uyear
  belongs_to :user
  validates_presence_of :user_id
  validates(:carmodel, presence: true, length: { :maximum => 30 })
  validates :price, presence: true, length: { :maximum => 10 } , numericality: true 
  validates(:cartype, presence: true, length: { :maximum => 30 })
  validates :myear, presence: true, length: { :maximum => 4  } , numericality: true 
  validates :uyear, presence: true, length: { :maximum => 2  } , numericality: true 
end
