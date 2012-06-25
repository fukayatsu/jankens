class Challenge < ActiveRecord::Base
  # TODO from, toをfirst,secondとかに変える

  attr_accessible :allow_draw, :result, :status,
    :from_choice, :from_message, :from_user_id,
    :to_choice, :to_message, :to_user_id

  #
  def self.match_count(user_id)
    Challenge.where('(from_user_id = ? OR to_user_id =  ?) AND status = ?',
      user_id, user_id, 'close').count
  end

  def self.open_count(user_id)
    Challenge.where('(from_user_id = ? OR to_user_id =  ?) AND status = ?',
      user_id, user_id, 'open').count
  end

  def self.win_count(user_id)
    Challenge.where('(from_user_id = ? AND result =  ?) OR (to_user_id = ? AND result =  ?)',
      user_id, 'from', user_id, 'to').count
  end

  def self.lose_count(user_id)
    Challenge.where('(from_user_id = ? AND result =  ?) OR (to_user_id = ? AND result =  ?)',
      user_id, 'to', user_id, 'from').count
  end

  def self.draw_count(user_id)
    Challenge.where('(from_user_id = ? OR to_user_id =  ?) AND result = ?',
      user_id, user_id, 'draw').count
  end

  def to
    User.find_by_id(self.to_user_id)
  end

  def from
    User.find_by_id(self.from_user_id)
  end

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
