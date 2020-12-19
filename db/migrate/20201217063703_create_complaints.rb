class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.references :user

      t.string :complaint, null: false, default: "" 
      t.string :nature,  null: false, default: ""
      t.string :action, null: false, default: ""
      t.string :method, null: false, default: ""

      t.timestamps 
    end
  end
end
