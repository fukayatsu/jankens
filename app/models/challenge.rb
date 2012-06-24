class Challenge < ActiveRecord::Base
  attr_accessible :allow_draw, :from_choice, :from_message, :from_user_id, :result, :status, :to_choice, :to_message, :to_user_id
end
