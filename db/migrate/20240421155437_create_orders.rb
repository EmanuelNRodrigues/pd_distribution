class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :weight
      t.string :payement_value
      t.string :services
      t.integer :packets_count
      t.string :comments
      t.datetime :collected_at

      t.references :sender, index: true, foreign_key: { to_table: :address_informations }, null: false
      t.references :recipient, index: true, foreign_key: { to_table: :address_informations }, null: false

      t.timestamps
    end
  end
end
