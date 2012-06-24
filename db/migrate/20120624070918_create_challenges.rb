class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
