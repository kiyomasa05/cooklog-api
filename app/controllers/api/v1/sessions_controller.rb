module Api
  module V1
    class SessionsController < ApplicationController
      before_action :current_user, only: [:logged_in?]

      def create
        user = User.find_by(email: session_params[:email])

        if user && user.authenticate(session_params[:password])
          session[:user_id] = user.id
          # login user
          render json: {
                  status:200,
                  logged_in: true,
                  user: user,
                }, methods: [:avatar_url]
        else
          render json: { status: 401, errors: ["正しいメールアドレス・パスワードを入力して下さい"], user: user}
        end
      end

      def logout
        reset_session
        render json: { status: 200, logged_in: false }
      end

      def logged_in?
        #おろらく@current_userがnilになっているため、帰ってこない
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        if @current_user
          render json: {
                  status: 200,
                  logged_in: true,
                  user: current_user,
                }, methods: [:avatar_url]
        else
          render json: { 
            status:401,
            logged_in: false,
            # errors: @current_user.errors.full_messages 
            session: session[:user_id],
            user: @current_user,
            errors: ["ログインしてください"] 
          }
        end
      end

      private

      def session_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
