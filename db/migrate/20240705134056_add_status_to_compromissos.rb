class AddStatusToCompromissos < ActiveRecord::Migration[7.1]
  def change
    add_column :compromissos, :status, :boolean,  default: false
  end
end
