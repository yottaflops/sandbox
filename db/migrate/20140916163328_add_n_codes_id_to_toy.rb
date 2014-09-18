class AddNCodesIdToToy < ActiveRecord::Migration
  def change
    add_column :toys, :n_code_id, :integer
  end
end
