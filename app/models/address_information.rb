# == Schema Information
#
# Table name: address_informations
#
#  id           :bigint           not null, primary key
#  address1     :string           not null
#  address2     :string           not null
#  city         :string           not null
#  name         :string           not null
#  phone_number :string
#  postal_code1 :integer          not null
#  postal_code2 :integer          not null
#  type         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_address_informations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class AddressInformation < ApplicationRecord
    belongs_to :user, optional: true
end