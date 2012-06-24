class Challenge < ActiveRecord::Base
  attr_accessible :allow_draw,
   :from_choice, :from_message, :from_user_id,
   :result, :status,
   :to_choice, :to_message, :to_user_id

  #ジャンケンの勝者をセットする
  def set_result
    # 0:グー、1:チョキ、2:パー
    case self.from_choice - self.to_choice
    when 0
      self.result = 'draw'
    when -1, 2
      self.result = 'from'
    when 1, -2
      self.result = 'to'
    end

    save!
  end
end
