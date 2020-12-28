class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :featured
      t.boolean :enabled
      t.float :start_amount

      t.timestamps
    end
  end
end
