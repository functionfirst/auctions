class ChangeDateFormatInAuctions < ActiveRecord::Migration[6.1]
  def change
    change_column :auctions, :start_date, :datetime
    change_column :auctions, :end_date, :datetime
  end
end
