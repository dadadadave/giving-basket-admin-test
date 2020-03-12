class CreateNonprofits < ActiveRecord::Migration[6.0]
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.text :address
      t.string :stripe_acct

      t.timestamps
    end
  end
end
