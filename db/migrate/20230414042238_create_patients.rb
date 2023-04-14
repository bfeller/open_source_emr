class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.date :dob
      t.belongs_to :user, null: true, foreign_key: true
      t.string :gender
      t.string :health_card
      t.string :version_code
      t.datetime :archived_at
      t.text :notes

      t.timestamps
    end
  end
end
