class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :text
      t.datetime :start_date
      t.integer :duration
      t.integer :prent
      t.decimal :progress

      t.timestamps
    end
  end
end
