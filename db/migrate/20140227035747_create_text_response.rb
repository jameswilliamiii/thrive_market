class CreateTextResponse < ActiveRecord::Migration
  def change
    create_table :text_responses do |t|
      t.string :phone_number
      t.text :message
      t.timestamps
    end
  end
end
