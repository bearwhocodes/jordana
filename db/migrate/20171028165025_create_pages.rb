class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string    :slug
      t.timestamps
    end

    Page.create! slug: 'home'
    Page.create! slug: 'about'
  end
end
