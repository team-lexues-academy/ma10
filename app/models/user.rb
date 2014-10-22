class User < ActiveRecord::Base
  devise :registerable,
         :omniauthable, omniauth_providers: [:twitter]
end
