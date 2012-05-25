class AddUuidToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :uuid, :string
  end
end
