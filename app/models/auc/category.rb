# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  ancestry   :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base

  has_ancestry
  has_many :global_attribute_catalogs,dependent: :destroy
  accepts_nested_attributes_for :global_attribute_catalogs,:allow_destroy => true

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
