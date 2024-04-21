# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  collected_at         :datetime
#  comments             :text
#  packets_count        :integer
#  payement_value       :string
#  services             :string
#  weight               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  recipient_address_id :bigint
#  user_id              :bigint           not null
#
# Indexes
#
#  index_orders_on_recipient_address_id  (recipient_address_id)
#  index_orders_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_address_id => address_informations.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :recipient_address, class_name: 'AddressInformation'
  belongs_to :user
end
