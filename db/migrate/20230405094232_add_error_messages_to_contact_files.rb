class AddErrorMessagesToContactFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :contact_files, :error_messages, :text
  end
end
