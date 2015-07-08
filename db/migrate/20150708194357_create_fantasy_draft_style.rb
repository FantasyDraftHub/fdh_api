class CreateFantasyDraftStyle < ActiveRecord::Migration
  def change
    create_table :fantasy_draft_styles do |t|
      t.string :name
    end
  end
end
