class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.integer :amount
      t.timestamp :sent_at
      t.references :nonprofit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
