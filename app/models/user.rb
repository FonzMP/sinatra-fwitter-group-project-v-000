class User < ActiveRecord::Base

  has_secure_password

  has_many :tweets

  validates :username, :email, :password, presence: true

  def slug
    @slug = self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.each do |slug_user|
      if slug_user == slug
        @user = slug_user
    end
  end

end
