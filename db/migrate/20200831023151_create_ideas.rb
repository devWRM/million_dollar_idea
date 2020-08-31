class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :inspiration
      t.text :plan
      t.integer :budgeted_dollars
      t.integer :spent_dollars
      
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
