class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.string  :name
      t.string  :email
      t.string  :telephone
      t.string  :message_type
      t.text    :message
      t.integer :project_budget
      t.text    :project_description
      t.timestamps
    end
  end
end
