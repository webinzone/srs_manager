class FeeFreqToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :fee_freq, :string
  end
end
