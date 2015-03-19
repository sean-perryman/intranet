class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.datetime :date_submitted
      t.datetime :date_occurred
      t.string :affected_user
      t.text :problem_description
      t.datetime :date_resolved
      t.text :problem_resolution

      t.timestamps null: false
    end
  end
end
