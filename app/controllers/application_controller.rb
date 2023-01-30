class ApplicationController < ActionController::Base
# ログインしていないとトップページ以外は表示できない  
  before_action :authenticate_member!, except: [:top]

end
