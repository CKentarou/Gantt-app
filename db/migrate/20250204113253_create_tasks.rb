class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :text
      t.datetime :start_date
      t.integer :duration
      t.integer :parent
      t.decimal :progress
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
