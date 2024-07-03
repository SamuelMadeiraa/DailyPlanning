class CreateCompromissos < ActiveRecord::Migration[7.1]
  def change
    create_table :compromissos do |t|
      t.string :titulo
      t.string :local

      t.timestamps
    end
  end
end
