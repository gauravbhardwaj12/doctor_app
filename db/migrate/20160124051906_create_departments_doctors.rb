class CreateDepartmentsDoctors < ActiveRecord::Migration
  def change
    create_table :departments_doctors, id: false do |t|
      t.integer :doctor_id
      t.integer :department_id
    end
  end
end
