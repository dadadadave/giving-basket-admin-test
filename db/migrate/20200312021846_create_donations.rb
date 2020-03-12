class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.references :nonprofit, null: false, foreign_key: true
      t.references :check, foreign_key: true

      t.timestamps
    end
  end
end
