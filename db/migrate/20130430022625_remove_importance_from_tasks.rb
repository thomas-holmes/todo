class RemoveImportanceFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :importance
  end

  def down
    add_column :tasks, :importance, :string
  end
end
