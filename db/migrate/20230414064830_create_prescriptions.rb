class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.belongs_to :appointment, null: true, foreign_key: true
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :diagnosis, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
