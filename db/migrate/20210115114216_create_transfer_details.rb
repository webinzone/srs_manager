class CreateTransferDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_details do |t|
    	t.string :user_name, null: false, default: "" 
      t.string :dob, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.string :nationality, null: false, default: ""
      t.string :languages, null: false, default: ""
 			t.string :religion, null: false, default: ""     
      t.string :medicare_no, null: false, default: ""
      t.string :pension_no, null: false, default: ""
      t.string :chemist, null: false, default: ""
      t.string :date, null: false, default: ""
      t.string :from, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :ph, null: false, default: ""
      t.string :fax, null: false, default: ""
      t.string :to, null: false, default: ""
      t.string :reason, null: false, default: ""
      t.string :medication_chart, null: false, default: ""
      t.string :medication_list, null: false, default: ""
      t.string :websterpak, null: false, default: ""
      t.string :medication_sent, null: false, default: ""
      t.string :last_time_medication, null: false, default: ""   
      t.string :accompanying_reports, null: false, default: ""    
      t.string :next, null: false, default: ""    
      t.string :advised, null: false, default: ""   
      t.string :guardian, null: false, default: ""   
      t.string :guardian_advised, null: false, default: ""   
      t.string :case_manager, null: false, default: ""   
      t.string :case_manager_advised, null: false, default: ""   
      t.string :nomini, null: false, default: ""    
      t.string :nomini_advised, null: false, default: ""    
      t.string :admin, null: false, default: ""    
      t.string :admin_advised, null: false, default: ""    

      t.timestamps 
    end
  end
end
