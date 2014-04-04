# == Schema Information
#
# Table name: groups
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  logo                :string(255)
#  is_confirm_required :boolean          default(FALSE)
#  topics_count        :integer          default(0)
#  members_count       :integer          default(0)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  is_recommended      :boolean          default(FALSE)
#

class Group < ActiveRecord::Base

  attr_accessor :is_agreed
  attr_readonly :topics_count, :members_count

  acts_as_taggable

  validates :name, :description, presence: true
  validate :check_agreed

  has_many :group_users
  has_many :members, through: :group_users, source: :user

  has_many :joined_group_users, -> {where('group_users.is_confirmed = ?', true)}, class_name: 'GroupUser'
  has_many :pending_group_users, -> {where('group_users.is_confirmed = ?', false)}, class_name: 'GroupUser'

  has_many :joined_members, through: :joined_group_users, source: :user
  has_many :pending_members, through: :pending_group_users, source: :user

  has_many :topics,dependent: :destroy

  belongs_to :user

  symbolize :is_confirm_required, in: [true, false], default: false

  scope :recommended, ->{ where(is_recommended: true) }

  searchable do
    string :klass do
      self.class.name
    end
    text :name,  stored: true
    text :description, stored: true
  end

  def logo_url(width=60, height=60)
    logo << "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end

  def related_with user
    return :guest if user.blank?
    group_user = self.group_users.where(user_id: user.id).first
    return :guest unless group_user.present?
    group_user.is_confirmed? ? :member : :pending
  end

  def check_agreed
    unless is_agreed == '1' || is_agreed == true
      errors.add(:is_agreed, '请先阅读并同意《社区指导原则》和 免责声明!')
    end
  end
end
