class CreateActivitiesMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :activities_members, :id => false do |t|
      t.references :activity, foreign_key: true
      t.references :member, foreign_key: true
    end
  end
end
