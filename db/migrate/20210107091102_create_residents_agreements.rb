class CreateResidentsAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :residents_agreements do |t|
    	t.string :user_name, null: false, default: "" 
      t.string :room_no, null: false, default: ""
      t.string :bed, null: false, default: ""
      t.string :dob, null: false, default: ""
      t.string :guardian, null: false, default: ""
      t.string :admin, null: false, default: ""
      t.string :person_nominated, null: false, default: ""
      t.string :stay_period, null: false, default: ""
      t.string :fixed_period, null: false, default: ""
      t.string :ending_on, null: false, default: ""
      t.string :accommodation_fee, null: false, default: ""
      t.string :payment_via, null: false, default: ""
      t.string :payment_frequency, null: false, default: ""
      t.string :advanced_fee, null: false, default: ""
      t.string :security_deposit, null: false, default: ""
      t.string :reservation_charge, null: false, default: ""
      t.string :establishment, null: false, default: ""
      t.string :condition_report_status, null: false, default: ""
      t.string :services, null: false, default: ""
      t.string :personal_properties, null: false, default: ""    
      t.timestamps 
    end
  end
end
