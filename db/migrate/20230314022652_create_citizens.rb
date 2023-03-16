class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :full_name, null: false
      t.string :photo, null: false
      t.date :birth_date, null: false
      t.string :telephone, null: false
      t.string :cpf, null: false, unique: true
      t.string :cns, null: false
      t.string :email, null: false, unique: true
      t.boolean :status, null: false

      t.timestamps
    end
  end
end
