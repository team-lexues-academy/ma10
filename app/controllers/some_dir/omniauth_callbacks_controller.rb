class SomeDir::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    render text: omniauth
    redirect_to_next_page
  end

  private

    def omniauth
      @omniauth ||= request.env["omniauth.auth"].slice(:provider, :uid)
    end

    def authentication
      @authentication ||= Authentication.find_by provider: omniauth[:provider], uid: omniauth[:uid]
    end

    def redirect_to_next_page
      # 既にログインしていれば何も行わない。
      if current_user
        redirect_to root_path, notice: "もうログインしてるんだけど！"

      # 既に登録があればその belongs_to である User をログインさせる。
      elsif authentication
        sign_in authentication.user
        redirect_to root_path, notice: "ログインしたよ。"

      # まだ登録がなければユーザー登録ページへリダイレクトさせて必要な項目を入力してもらう。
      else
        session[:omniauth] = omniauth
        redirect_to new_user_registration_path, notice: "必要な項目を入力してね。"
    end
end
