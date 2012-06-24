class User < ActiveRecord::Base
  attr_accessible :bio, :name, :twitter_id

  def self.create_with_omniauth(auth)
    create! do |user|
      user.twitter_id = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.bio = "hoge"
    end
  end
end
