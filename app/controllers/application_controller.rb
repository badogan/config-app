class ApplicationController < ActionController::API

    before_action :authorized

    def get_current_user
        id = decoded_token['id']
        User.find_by(id: id)
      end

      def logged_in?
        !!get_current_user
      end

      def authorized
        render json: {message:'Please sign in'}, status: :unauthorized unless logged_in?
      end
    
      def decoded_token
        begin
          JWT.decode(token, secret).first # {id: 1}
        rescue
          {}
        end
      end
    
      def token
        request.headers['Authorization']
      end
    
      def issue_token(payload)
        JWT.encode(payload, secret)
      end
    
      def secret
        ENV['MY_SECRET']
      end

end
