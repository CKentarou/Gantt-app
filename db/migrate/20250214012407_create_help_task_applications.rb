class CreateHelpTaskApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :help_task_applications do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
