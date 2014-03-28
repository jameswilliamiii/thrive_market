class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :content
      t.date :send_date
      t.boolean :send_immediately

      t.timestamps
    end
    add_index :updates, :send_date
  end
end
