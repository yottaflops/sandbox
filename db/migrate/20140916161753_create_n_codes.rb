class CreateNCodes < ActiveRecord::Migration
  def change
    create_table :n_codes do |t|
      t.string :term

      t.timestamps
    end
  end
end
