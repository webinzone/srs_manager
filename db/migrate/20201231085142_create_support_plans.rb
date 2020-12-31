class CreateSupportPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :support_plans do |t|
      t.string :user_name, null: false, default: "" 
      t.string :Hygiene,  null: false, default: ""
      t.string :nutrition, null: false, default: ""
      t.string :health_care, null: false, default: ""
      t.string :medication, null: false, default: ""
      t.string :social_contact, null: false, default: ""
      t.string :behaviour, null: false, default: ""
      t.string :goals, null: false, default: ""
      t.timestamps 

    end
  end
end
