class AddLinkToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :link, :string
  end
end
