class ResetArtworksCountForUsers < ActiveRecord::Migration
  def change
    User.all.each do |user|
      User.reset_counters(user.id, :artworks)
    end
  end
end
