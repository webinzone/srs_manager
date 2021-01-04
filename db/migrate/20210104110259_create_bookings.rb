class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.string :user_name, null: false, default: "" 
      t.string :book_from,  null: false, default: ""
      t.string :book_to, null: false, default: ""
      t.string :room, null: false, default: ""
      t.string :bed, null: false, default: ""
      t.string :payment, null: false, default: ""
      t.string :fee, null: false, default: ""
      t.string :dob, null: false, default: ""
      t.string :age, null: false, default: ""
      t.string :contact, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :discharge_reason, null: false, default: ""
      t.string :car_needs, null: false, default: ""
      t.string :diagnosis_history, null: false, default: ""
      t.string :behaviours, null: false, default: ""
      t.string :substance, null: false, default: ""
      t.string :assistance, null: false, default: ""
      t.string :casemanager, null: false, default: ""
      t.string :social_worker, null: false, default: ""
      t.string :forensic_history, null: false, default: ""
      t.string :notes, null: false, default: ""
      t.timestamps 
    end
  end
end
