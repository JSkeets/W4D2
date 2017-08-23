class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.text :color, null: false
      t.text :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description

      t.timestamps

    end

    add_index :cats, :name
    add_index :cats, :color
    add_index :cats, :birth_date
    add_index :cats, :sex
  end
end
