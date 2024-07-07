class CreateCategoria < ActiveRecord::Migration[7.1]
  def change
    create_table :categoria do |t|
      t.string :titulo
      t.references :compromisso, null: false, foreign_key: true
      t.references :financeiro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
