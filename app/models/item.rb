class Item < ApplicationRecord
  belongs_to :list
  has_one :user, {through: :list}

  before_create :keyword_association

  private

  def keyword_association
    keywords = Keyword.all
    keywords.each do |keyword|
      if keyword.item.downcase == self.name.downcase
        return self.keyword = keyword.name
        break
      end
    end

    if self.keyword == nil
     video_games = JSON.parse(open("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=name&search=#{self.name}",
      "X-Mashape-Key" => "#{ENV["VIDEO_GAMES"]}").read)

      if video_games[0] != nil
        video_games.each do |game|
          if game["name"].match(self.name) && game["name"].match(self.name)[0].downcase == self.name.downcase

            return self.keyword = "Video Game"
          end
        end
      end
    end
    if self.keyword == nil
      self.keyword = self.name
    end
  end


end
