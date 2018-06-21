class User < ActiveRecord::Base

  has_secure_password

  has_many :tweets

  validates :username, :email, :password, presence: true

  def slug
    @slug = self.username.downcase.gsub(" ", "-")
  end

  def User.find_by_slug

  end

end
