class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :from_message
      t.integer :from_user_id
      t.integer :from_choice

      t.text :to_message
      t.integer :to_user_id
      t.integer :to_choice

      t.string :status

      t.boolean :allow_draw
      
      t.text :result

      t.timestamps
    end
  end
end
