class CreateAgreements < ActiveRecord::Migration[8.0]
  def change
    create_table :agreements do |t|
      t.string :number
      t.string :client_identification_no
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
