# == Schema Information
#
# Table name: address_informations
#
#  id               :bigint           not null, primary key
#  address1         :string           not null
#  address2         :string
#  addressable_type :string
#  city             :string           not null
#  name             :string           not null
#  phone_number     :string
#  postal_code1     :integer          not null
#  postal_code2     :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#
# Indexes
#
#  index_address_informations_on_addressable  (addressable_type,addressable_id)
#
class AddressInformation < ApplicationRecord
  belongs_to :addressable, polymorphic: true # can be Orders or Users
end
