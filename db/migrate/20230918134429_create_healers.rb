class CreateHealers < ActiveRecord::Migration[7.0]
  def change
    create_table :healers do |t|
      t.string :name
      t.string :service
      t.string :description
      t.string :contact

      t.timestamps
    end
  end
end
