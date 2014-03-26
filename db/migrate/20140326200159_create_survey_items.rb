class CreateSurveyItems < ActiveRecord::Migration
  def change
    create_table :survey_items do |t|
      t.text :message
      t.string :phone_number
      t.string :from_city
      t.string :from_state

      t.timestamps
    end
  end
end
