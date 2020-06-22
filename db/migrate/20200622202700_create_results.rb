class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :empathy
      t.integer :communication
      t.integer :sharedecision
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
