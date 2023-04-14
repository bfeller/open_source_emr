class CreatePatientContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_contacts do |t|
      t.string :name
      t.belongs_to :patient, null: false, foreign_key: true
      t.boolean :primary
      t.string :phone
      t.string :email
      t.string :address
      t.string :contact_method
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
