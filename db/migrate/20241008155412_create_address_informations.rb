class CreateAddressInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :address_informations do |t|
      t.string :name, null: false
      t.string :address1, null: false
      t.string :address2
      t.integer :postal_code1, null: false
      t.integer :postal_code2, null: false
      t.string :city, null: false
      t.string :phone_number
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end

  end
end
