# == Schema Information
#
# Table name: conversations
#
#  id              :integer          not null, primary key
#  sender_id       :integer
#  recipient_id    :integer
#  is_read         :boolean          default(FALSE)
#  is_archived     :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  messages_count  :integer          default(0)
#  type_identifier :string(255)
#

require 'spec_helper'

describe Conversation do
  pending "add some examples to (or delete) #{__FILE__}"
end
