require 'rails_helper'

RSpec.describe "Index", type: :request do
  describe "レシピ一覧" do
    before do
      @user = create(:user)
      FactoryBot.create_list(:recipe,10)
      # @recipe.image = fixture_file_upload("/files/test_image.jpg")
    end
      login_url='/api/v1/login'

      context 'ユーザーデータが見つからない場合' do
        it 'エラーメッセージを返す' do
          post login_url,params:{user:{email: 'sample@sample.com', password: '1234'}}
          expect(json['errors']).to eq(['正しいメールアドレス・パスワードを入力して下さい' ])
          expect(json['status']).to eq(401)
        end
      end
      context '投稿一覧を取得' do
        it '正常処理' do
          get '/api/v1/recipes'
          json=JSON.parse(response.body)

          #リクエスト成功
          expect(response.status).to eq(200)
          #正しい数のrecipeが取得できたか
          # expect(json['data'].length).to eq(10)
        end
      end

      
  end
end
