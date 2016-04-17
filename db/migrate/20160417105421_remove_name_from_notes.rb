class RemoveNameFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :name, :string
  end
end
