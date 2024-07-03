class CreateEstudos < ActiveRecord::Migration[7.1]
  def change
    create_table :estudos do |t|
      t.string :titulo
      t.string :descricao

      t.timestamps
    end
  end
end
