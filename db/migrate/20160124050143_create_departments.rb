class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :dpt_name
      t.string :dpt_manager

      t.timestamps null: false
    end
  end
end
