class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :weight
      t.string :payement_value
      t.string :services
      t.integer :packets_count, null: false
      t.text :comments
      t.datetime :collected_at
      t.integer :status, null: false
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
