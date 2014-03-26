class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.boolean :verified, default: false

      t.timestamps
    end
    add_index :phone_numbers, :number
    add_index :phone_numbers, :verified
  end
end
