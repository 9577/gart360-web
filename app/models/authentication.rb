# == Schema Information
#
# Table name: authentications
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  uid          :string(255)
#  provider     :string(255)
#  access_token :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Authentication < ActiveRecord::Base

  validates :provider, :uid, :access_token, presence: true
  validates :provider, uniqueness: { scope: :user_id }

  belongs_to :user

  def self.create_from_hash(user_id, omniauth)
    self.create!(
      user_id:      user_id,
      provider:     omniauth.provider,
      uid:          omniauth.uid,
      access_token: omniauth.credentials.token
    )
  end

  after_create :get_user_email!

  def get_user_email!
    begin
      email = Weibo.new(access_token).email['email']
      if email
        user.email = email
        user.save(validate: false)
      end
    rescue Exception => e
      p e.message
    end
  end

end
