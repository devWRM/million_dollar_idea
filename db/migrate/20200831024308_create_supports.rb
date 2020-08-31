class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.integer :cost
      
      t.belongs_to :idea, null: false, foreign_key: true
      t.belongs_to :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
