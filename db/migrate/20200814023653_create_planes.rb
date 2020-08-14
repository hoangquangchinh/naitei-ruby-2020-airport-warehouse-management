class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.string :code
      t.string :status

      t.timestamps
    end
  end
end
