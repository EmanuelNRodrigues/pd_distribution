class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :weight
      t.string :payement_value
      t.string :services
      t.integer :packets_count
      t.text :comments
      t.datetime :collected_at
      t.references :user, index: true, null: false, foreign_key: true
      t.references :recipient_address, index: true, foreign_key: { to_table: :address_informations }

      t.timestamps
    end
  end
end
