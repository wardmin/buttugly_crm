class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :number
      t.string :email
      t.string :twitter
      t.string :notes

      t.timestamps
    end
  end
end
