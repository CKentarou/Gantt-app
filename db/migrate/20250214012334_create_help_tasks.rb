class CreateHelpTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :help_tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :reward
      t.datetime :deadline
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
