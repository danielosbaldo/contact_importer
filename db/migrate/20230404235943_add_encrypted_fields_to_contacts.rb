class AddEncryptedFieldsToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :encrypted_credit_card_number, :string
    add_column :contacts, :encrypted_credit_card_number_iv, :string
  end
end
