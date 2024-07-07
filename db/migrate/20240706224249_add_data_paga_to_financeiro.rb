class AddDataPagaToFinanceiro < ActiveRecord::Migration[7.1]
  def change
    add_column :financeiros, :data_paga, :datetime
  end
end
