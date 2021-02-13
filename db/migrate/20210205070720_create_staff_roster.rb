class CreateStaffRoster < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_rosters do |t|
    	t.string :date, null: false, default: "" 
      t.string :staff_name, null: false, default: ""
      t.string :position, null: false, default: ""
      t.string :monday, null: false, default: ""
      t.string :tuesday, null: false, default: ""
 			t.string :wednesday, null: false, default: ""     
      t.string :thursday, null: false, default: ""
      t.string :friday, null: false, default: ""
      t.string :saturday, null: false, default: ""
      t.string :sunday, null: false, default: ""
      t.string :total_hrs, null: false, default: ""
      t.string :total, null: false, default: ""

      t.timestamps
    end
  end
end
