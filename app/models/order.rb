# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  collected_at   :datetime
#  comments       :text
#  packets_count  :integer          not null
#  payement_value :string
#  services       :string
#  status         :integer          not null
#  weight         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  has_many :addresses, class_name: 'AddressInformation', as: :addressable, dependent: :delete_all
  belongs_to :user

  enum status: [:collecting, :warehouse, :delivering, :delivered, :error]

  validates :status, presence: { message: "Define um estado da encomenda" }
  validates :packets_count, presence: { message: "Indica o número de volumes" }
end
