class AddHealerToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :healer, :string
  end
end
