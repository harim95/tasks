class ChangeTypeActivity < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :enddate, :date
  end
end
