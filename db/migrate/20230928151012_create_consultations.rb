class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :text
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
