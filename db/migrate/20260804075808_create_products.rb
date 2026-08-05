class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :segment
      t.string :strength
      t.string :dosage_form
      t.string :short_description
      t.text :description
      t.text :composition
      t.text :indications
      t.text :storage
      t.string :packaging
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
