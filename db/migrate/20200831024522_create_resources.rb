class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :source

      t.belongs_to :idea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
