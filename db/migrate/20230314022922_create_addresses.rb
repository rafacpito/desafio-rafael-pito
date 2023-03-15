class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :complement
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :postal_code, null: false
      t.string :ibge_code
      t.references :citizen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
