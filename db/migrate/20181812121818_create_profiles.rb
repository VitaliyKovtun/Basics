class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :language
      t.string :country
      t.date :birth_date
      t.boolean :admin, default: false
      t.references :user, null: false, index: true
    end
  end
end
