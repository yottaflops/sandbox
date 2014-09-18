class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :document_number
      t.text :excerpts
      t.string :html_url
      t.string :type
      t.text :title

      t.timestamps
    end
  end
end
