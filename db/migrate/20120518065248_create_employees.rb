class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email_id
      t.date  :created_at
      t.string :password
      t.string :department
      t.string :forwards
      t.string :category
      t.string :group_head
      t.string :requisition_by
      t.string :handled_by
      t.integer :employee_id
      t.date  :delete_on


      t.timestamps
    end



  end
end
