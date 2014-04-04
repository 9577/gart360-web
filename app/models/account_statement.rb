# == Schema Information
#
# Table name: account_statements
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  amount          :decimal(20, 2)
#  type_identifier :string(255)
#  meta            :string(255)
#  description     :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class AccountStatement < ActiveRecord::Base

  META_TYPES = [ :recharged, :deposit_freezed, :deposit_removed, :product_sold, :withdrawed ]
  TYPE_IDENTIFIERS = [ :income, :outgoing ]


  validates :amount, presence: true

  belongs_to :user

  symbolize :type_identifier, in: TYPE_IDENTIFIERS, methods: :shallow
  symbolize :meta, in: META_TYPES

end
