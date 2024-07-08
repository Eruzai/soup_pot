class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_time
      t.boolean :private
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
