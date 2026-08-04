class CreateInquiries < ActiveRecord::Migration[8.1]
  def change
    create_table :inquiries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :company
      t.string :subject
      t.text :message, null: false

      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :inquiries, :email
    add_index :inquiries, :status
  end
end
