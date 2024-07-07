class AddStatusToFinanceiro < ActiveRecord::Migration[7.1]
  def change
    add_column :financeiros, :status, :boolean
  end
end
