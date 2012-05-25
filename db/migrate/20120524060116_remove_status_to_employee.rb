class RemoveStatusToEmployee < ActiveRecord::Migration
  def up
    remove_column :employees, :status
      end

  def down
    add_column :employees, :status, :string
  end
end
