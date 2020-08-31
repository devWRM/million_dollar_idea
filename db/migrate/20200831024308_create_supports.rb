class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.integer :budgeted_dollars
      t.integer :spent_dollars
      t.integer :budgeted_dollars_remaining
      t.boolean :within_budget
      t.belongs_to :idea, null: false, foreign_key: true
      t.belongs_to :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
