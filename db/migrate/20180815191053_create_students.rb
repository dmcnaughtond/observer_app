class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.references :room, foreign_key: true

      t.timestamps
    end
    add_index :students, [:room_id, :name]
  end
end
