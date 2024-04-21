# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  collected_at   :datetime
#  comments       :string
#  packets_count  :integer
#  payement_value :string
#  services       :string
#  weight         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :bigint           not null
#  sender_id      :bigint           not null
#
# Indexes
#
#  index_orders_on_recipient_id  (recipient_id)
#  index_orders_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => address_informations.id)
#  fk_rails_...  (sender_id => address_informations.id)
#
class Order < ApplicationRecord
end
