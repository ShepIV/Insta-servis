class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :second_name
      t.bigint :user_id

      t.timestamps
    end
  end
end
