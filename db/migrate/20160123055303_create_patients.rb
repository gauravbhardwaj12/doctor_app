class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :diseas
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
