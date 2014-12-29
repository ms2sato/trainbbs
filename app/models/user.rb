class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      if user.provider == "github"
        user.name = auth["info"]["name"]
        user.email = auth["info"]["email"]
        user.nickname = auth["info"]["nickname"]
        user.image = auth["info"]["image"]
        user.token = auth["credentials"]["token"]
        user.password = 'dummypassword'
      end

    end
  end


end
