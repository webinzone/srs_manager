class CreateIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_reports do |t|
    	t.string :user_name, null: false, default: "" 
      t.string :incident_type,  null: false, default: ""
      t.string :other_type, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :action, null: false, default: ""
      t.string :staff, null: false, default: ""
      t.string :follow_notes, null: false, default: ""
      t.string :follow_staff, null: false, default: ""
      t.string :person_other, null: false, default: ""
      t.string :notify_date, null: false, default: ""
      t.timestamps 
    end
  end
end
