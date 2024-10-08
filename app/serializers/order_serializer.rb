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
class OrderSerializer
  class << self
    def single(order)
      order.slice(:id, :weight, :payement_value, :services, :packets_count, :comments, :status)
    end

    def collection(orders)
      orders.map do |order|
        single(order)
      end
    end
  end
end
