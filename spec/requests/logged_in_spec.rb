require 'rails_helper'

RSpec.describe "logged_in", type: :request do
  describe "get/logged_in" do
    logged_in_url='api/v1/logged_in'
    login_url='/api/v1/login'

    before do
      @user = create(:user)
      post login_url,params:{user:{email: @user.email, password: @user.password}}
      log_in(@user)
      # ログインする
      # logged_inに接続する
      # セッションが空でないか確認する
      # jssonを返すか確認する
      # ログイン状態でない状態でセッションが空か確認する
    end
    context 'ログインチェック' do
        it 'ログインしている場合' do
          expect do
            get logged_in_url
            expect(is_logged_in?).to be_truthy
            expect(json['logged_in']).to eq(true)
            # expect(session[:user_id]).to eq(user_id)
            expect(@current_user).to eq(@user)
        end
      end
        # it 'ログインしてない場合' do
        
        # end
    end
  end
end
