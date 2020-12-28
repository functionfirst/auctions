class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.float :value

      t.timestamps
    end
  end
end
