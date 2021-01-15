class CreateSrsReferals < ActiveRecord::Migration[5.2]
  def change
    create_table :srs_referals do |t|
    	t.string :user_name, null: false, default: "" 
      t.string :address, null: false, default: ""
      t.string :telephone, null: false, default: ""
      t.string :fax, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone2, null: false, default: ""
      t.string :email2, null: false, default: ""
      t.string :address2, null: false, default: ""
      t.string :r_name, null: false, default: ""
      t.string :p_name, null: false, default: ""
      t.string :dob, null: false, default: ""
      t.string :nok, null: false, default: ""
      t.string :case_manager, null: false, default: ""
      t.string :gaurdian, null: false, default: ""
      t.string :practitioner, null: false, default: ""
      t.string :nomini, null: false, default: ""
      t.string :admin, null: false, default: ""
      t.string :medicare_no, null: false, default: ""
      t.string :pension, null: false, default: ""
      t.string :languages, null: false, default: ""   
      t.string :religous, null: false, default: ""    
      t.string :nationality, null: false, default: ""    
      t.string :diagnosis, null: false, default: ""   
      t.timestamps 
    end
  end
end
