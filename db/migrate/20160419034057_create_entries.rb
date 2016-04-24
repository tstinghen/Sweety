class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :cbg
      t.datetime :date

      t.timestamps null: false
    end
  end
end
