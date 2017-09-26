class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string    :title
      t.text      :html
      t.datetime  :publish_at
      t.timestamps
    end
  end
end
