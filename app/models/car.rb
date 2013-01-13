class Car < ActiveRecord::Base
  attr_accessible :carmodel, :cartype, :myear, :price, :user_id, :uyear
end
