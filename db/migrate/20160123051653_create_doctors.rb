class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.integer :fees

      t.timestamps null: false
    end
  end
end
