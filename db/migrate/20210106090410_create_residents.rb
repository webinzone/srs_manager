class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
    	t.string :surname, null: false, default: "" 
      t.string :fname,  null: false, default: ""
      t.string :mname, null: false, default: ""
      t.string :prefered_name, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.string :room_no, null: false, default: ""
      t.string :fee, null: false, default: ""
      t.string :bed, null: false, default: ""
      t.string :pay_frequency, null: false, default: ""
      t.string :dob, null: false, default: ""
      t.string :payment_via, null: false, default: ""
      t.string :arrival_date, null: false, default: ""
      t.string :admin, null: false, default: ""
      t.string :person_type, null: false, default: ""
      t.string :guardian, null: false, default: ""
      t.string :nationality, null: false, default: ""
      t.string :health_service, null: false, default: ""
      t.string :marital_status, null: false, default: ""
      t.string :case_manager, null: false, default: ""
      t.string :language_spoken, null: false, default: ""
      t.string :medical_practioner, null: false, default: ""
      t.string :next_kin, null: false, default: ""
      t.string :departure_date, null: false, default: ""
      t.timestamps 
    end
  end
end
