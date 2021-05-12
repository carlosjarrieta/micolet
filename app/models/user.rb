class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def gravatarurl
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
