class CreatePatientPharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_pharmacies do |t|
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :pharmacy, null: false, foreign_key: true
      t.boolean :preferred

      t.timestamps
    end
  end
end
