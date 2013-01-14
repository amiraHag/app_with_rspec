class Car < ActiveRecord::Base
  attr_accessible :carmodel, :cartype, :myear, :price, :user_id, :uyear
  def self.all_carmodels
    return ['toyota', 'fiat', 'bmw']
  end
end
