# == Schema Information
#
# Table name: default_tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  position   :integer
#

class DefaultTag < ActiveRecord::Base

  has_ancestry

  validates :name, presence: true

  default_scope { order(:position) }

  before_create :build_position

  def build_position
    if self.parent
      self.position = self.parent.children.count + 1
    else
      self.position = self.class.roots.count + 1
    end
  end

end
