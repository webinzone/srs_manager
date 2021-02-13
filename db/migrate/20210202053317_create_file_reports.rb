class CreateFileReports < ActiveRecord::Migration[5.2]
  def change
    create_table :file_reports do |t|
    	t.string :user_name, null: false, default: ""
      t.string :tittle, null: false, default: ""
      t.string :desc, null: false, default: ""
      t.string :file_name, null: false, default: ""

      t.timestamps
    	
    end
  end
end
