class CreateTarefas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.string :descricao
      t.boolean :status
      t.datetime :dataehora

      t.timestamps
    end
  end
end
