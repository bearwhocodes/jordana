class CreatePageElements < ActiveRecord::Migration[5.1]
  def change
    create_table :page_elements do |t|
      t.string  :slug
      t.text    :html
      t.references :page
      t.timestamps
    end
  end
end
