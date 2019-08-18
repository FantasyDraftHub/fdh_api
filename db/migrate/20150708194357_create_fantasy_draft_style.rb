class CreateFantasyDraftStyle < ActiveRecord::Migration[5.2]
  def change
    create_table :fantasy_draft_styles do |t|
      t.string :name
    end
  end
end
