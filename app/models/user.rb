# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  legacy_password_hash   :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  conversations_count    :integer          default(0)
#  addresses_count        :integer          default(0)
#  orders_count           :integer          default(0)
#  events_count           :integer          default(0)
#  galleries_count        :integer          default(0)
#  followers_count        :integer          default(0)
#  birthdate              :date
#  bio                    :text
#  avatar                 :string(255)
#  city_id                :integer
#  gender                 :string(255)
#  is_profile_completed   :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  statuses_count         :integer          default(0)
#  province_id            :integer
#  topics_count           :integer          default(0)
#  replies_count          :integer          default(0)
#  joined_events_count    :integer          default(0)
#  artworks_count         :integer          default(0)
#  collection_items_count :integer          default(0)
#  mobile_phone           :string(255)
#

class User < ActiveRecord::Base
  include Followable
  include UserAction
  include UserMessage

  attr_accessor :is_agreed, :mobile_signup, :login

  acts_as_taggable_on :intrests

  attr_readonly :conversations_count,
                :addresses_count,
                :orders_count,
                :events_count,
                :galleries_count,
                :followers_count,
                :statuses_count,
                :topics_count,
                :replies_count,
                :joined_events_count,
                :artworks_count,
                :collection_items_count

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: [:weibo],
         authentication_keys: [:login]

  validates :username, length: { minimum: 2, maximum: 20 }, uniqueness: { case_sensitive: false }, presence: true
  validates :email, confirmation: true, on: :update

  validate :validate_sms_verification_code!, on: :create

  # validates :mobile, uniqueness: true,
  #                   format: { with: /^1[3|5][0-9]\d{4,8}$/ }, if: :signup_via_mobile?


  has_one :artist
  has_one :user_payment

  has_many :statuses

  has_many :events

  has_many :artworks
  has_many :galleries
  has_many :educations
  has_many :awards
  has_many :exhibitions
  has_many :recharge_records
  has_many :withdraws

  has_many :orders
  has_many :bids
  ## Groups I've been created
  has_many :groups

  ## Groups and users relationshops
  has_many :group_users
  has_many :joined_group_users, -> {where('group_users.is_confirmed = ?', true)}, class_name: 'GroupUser'
  has_many :pending_group_users, -> {where('group_users.is_confirmed = ?', false)}, class_name: 'GroupUser'

  ## Groups I've joined
  has_many :joined_groups, through: :joined_group_users, source: :group
  ## Groups I've joved, but not confirmed yet.
  has_many :pending_groups, through: :pending_group_users, source: :group

  has_many :topics
  has_many :replies
  has_many :replied_topics, through: :replies, source: :topic

  has_many :account_statements

  has_many :likes
  ## 竞拍模块
  ## ================
  has_many :deposits
  has_many :addresses
  ## ================

  belongs_to :province
  belongs_to :city

  symbolize :gender, in: [ :male, :female ], scopes: :shallow, methods: true, default: :male

  delegate :name, to: :province, prefix: true, allow_nil: true
  delegate :name, to: :city, prefix: true, allow_nil: true

  accepts_nested_attributes_for :artist

  after_create :build_user_payment, :skip_confirm!

  def skip_confirm!
    self.confirm! if self.email.empty? && self.mobile_phone
  end

  searchable do
    string :klass do
      self.class.name
    end
    text :username,  stored: true
    text :email, stored: true
  end

  def validate_sms_verification_code!
    return if !signup_via_mobile? || !Rails.env.production?

    _captcha = Captcha.find_by(mobile_phone: self.mobile_phone)
    return if _captcha.nil?

    if _captcha.captcha != self.captcha
      errors.add(:captcha, '验证码错误')
    else
      if _captcha.captcha_sent_at < 10.minutes.ago
        Rails.logger.info "SMS verification code expired"
        errors.add(:captcha, '验证码已失效')
      end
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(mobile_phone) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    self.mobile_phone.nil? ? true : false
  end

  def signup_via_mobile?
    !!self.mobile_signup
  end

  def build_user_payment
    UserPayment.find_or_create_by(user_id: self.id)
  end

  def is_artist?
    !!artist
  end

  def avatar_url(width=176, height=176)
    avatar.blank? ? 'sns/user-header-bg.png' : avatar << "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end

  def location
    province.nil? ? '未设置地区' : "#{province_name}, #{city_name}"
  end

  def joined_groups_count
    joined_group_users.count
  end

  # after_save :sign

  def unread_inbox_conversations
    inbox_conversations.unread
  end

  def interest_people
    arr = self.tags.map {|x| x.id}
    u_arr = UserTag.where('tag_id in (?)',arr).where.not(user_id: self.id).map {|x| x.user_id}.uniq
    users = User.order('RAND()').find(u_arr)
  end

  # 人气小伙伴推荐
  def self.topic
    order('RAND()').limit(3)
  end

  def valid_password?(password)
    if self.legacy_password_hash.present?
      if ::Digest::MD5.hexdigest(password).upcase == self.legacy_password_hash
        self.password = password
        self.legacy_password_hash = nil
        self.save!
        true
      else
        false
      end
    else
      super
    end
  end

  def reset_password!(*args)
    self.legacy_password_hash = nil
    super
  end

  def join_group group
    group_user = GroupUser.find_or_initialize_by group_id: group.id, user_id: self.id
    group_user.is_confirmed = true unless group.is_confirm_required?
    group_user.save ? group_user : nil
  end

  def quit_group group
    group_user = GroupUser.find_by group_id: group.id, user_id: self.id
    group_user.destroy if group_user.present?
  end

  def has_bid?(product_id)
    bids.by_product(product_id).count > 0
  end

  def first_bid?
    bids.count == 1
  end


  protected

  def sign
    UserMailer.welcome_email(self).deliver
  end

end
