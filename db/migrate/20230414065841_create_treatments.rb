class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.belongs_to :diagnosis, null: false, foreign_key: true
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :appointment, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
