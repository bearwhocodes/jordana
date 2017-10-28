class CreateInitialUsers < ActiveRecord::Migration[5.1]
  def change
    User.create! email: ENV['JORDANA_EMAIL'], password: ENV['JORDANA_PASSWORD']
    User.create! email: ENV['STEVE_EMAIL'], password: ENV['STEVE_PASSWORD']
  end
end
