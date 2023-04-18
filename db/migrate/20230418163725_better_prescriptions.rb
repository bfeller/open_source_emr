class BetterPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :name, :string
    add_column :prescriptions, :dosage, :string
    add_column :prescriptions, :frequency, :string
    remove_reference :notes, :treatment
    add_reference :notes, :treatment, null: true, index: true, foreign_key: true
  end
end
