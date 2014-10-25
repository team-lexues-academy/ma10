class SomeDir::RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil uless @user.new_record?
    # これはユーザーの登録に成功していればsession[:omniauth}は不要なので削除するという記述。
  end

  protected
    # このメソッドを次のようにオーバーライドすることで
    # 保存される前の @user に authentication を持たせることができる。
    # @user が保存されれば authentication も保存される。
    def build_resource(*args)
      super
       if session[:omniauth]
          omniauth = session[:omniauth]
          @user.authentications.build provider: omniauth[:provider], uid: omniauth[:uid]
       end
    end
end
