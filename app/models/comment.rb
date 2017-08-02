class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  after_create :send_favorite_emails

  private

  def send_favorite_emails
  	post.favorites.each do |favorites|
  		FavoriteMailer.new_comment(favorites.user, post, self).deliver_now
  	end
  end
end
