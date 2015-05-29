class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :finish
      t.string :name

      t.timestamps null: false
    end
  end
end
