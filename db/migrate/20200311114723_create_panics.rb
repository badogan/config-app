class CreatePanics < ActiveRecord::Migration[6.0]
  def change
    create_table :panics do |t|
      t.boolean :status
      t.text :reason

      t.timestamps
    end
  end
end
