class AddColumnCampaignToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :campaign, index: true
  end
end
