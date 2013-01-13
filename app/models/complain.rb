class Complain < ActiveRecord::Base
  attr_accessible :detail, :solution, :subject, :user_id
end
