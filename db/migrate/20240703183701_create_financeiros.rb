class CreateFinanceiros < ActiveRecord::Migration[7.1]
  def change
    create_table :financeiros do |t|
      t.string :titulo
      t.datetime :data_vencimento
      t.boolean :status

      t.timestamps
    end
  end
end
