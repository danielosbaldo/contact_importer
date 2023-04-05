class CreateContactFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_files do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_name
      t.integer :status

      t.timestamps
    end
  end
end
