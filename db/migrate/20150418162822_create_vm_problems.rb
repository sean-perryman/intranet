class CreateVmProblems < ActiveRecord::Migration
  def change
    create_table :vm_problems do |t|
      t.string :who_are_you
      t.text :what_is_the_problem
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
