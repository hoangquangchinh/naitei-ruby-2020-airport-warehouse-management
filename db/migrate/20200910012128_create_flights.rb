class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime "time"
      t.string "status"
      t.string "title"
      t.string "from"
      t.string "to"
      t.references :plane, null: false, foreign_key: true

      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
