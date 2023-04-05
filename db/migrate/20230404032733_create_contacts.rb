class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.string :phone
      t.string :address
      t.string :credit_card_number
      t.string :credit_card_network
      t.string :email

      t.timestamps
    end
  end
end
