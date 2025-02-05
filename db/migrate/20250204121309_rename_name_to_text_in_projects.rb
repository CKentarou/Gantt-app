class RenameNameToTextInProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :name, :text
  end
end
