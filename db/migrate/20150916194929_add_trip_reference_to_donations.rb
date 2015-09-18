class AddTripReferenceToDonations < ActiveRecord::Migration
  def up
    rename_column :trips, :donation, :donation_old
    add_reference :donations, :trip, index: true
  end
  def down
    remove_reference :donations, :trip
    rename_column :trips, :donation_old, :donation
  end
end
