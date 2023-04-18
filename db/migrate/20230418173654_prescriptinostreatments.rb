class Prescriptinostreatments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :prescriptions, :diagnosis
    add_reference :prescriptions, :treatment, foreign_key: true, index: true
  end
end
