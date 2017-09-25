class CreateInitialUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :initial_users do |t|
      User.create! email: ENV['JORDANA_EMAIL'], password: ENV['JORDANA_PASSWORD']
      User.create! email: ENV['STEVE_EMAIL'], password: ENV['STEVE_PASSWORD']
    end
  end
end
