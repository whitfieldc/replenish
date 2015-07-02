class WelcomeController < ApplicationController
  # skip_before_filter :verify_authenticity_token, :only => :create

  def index
  end

  def create
    if request.xhr?
      # binding.pry
      @u = User.where(auth_id: params["auth_id"]).first
      p @u
      # binding.pry
      # @list = @u.itemsers
      if @u.nil?
        @u = User.create( auth_id: params["auth_id"], name: params["name"] )
        @list = @u.get_list
        p "Here's list:"
        p @list
        p 'rendering'
        session[:current_user] = @u.id
        # hello = session[:user_id]
        p "SESSION:"
        p session[:current_user]
        # p hello
        # binding.pry
        render partial: "welcome/main", locals: { user: @u, list: @list}
      else
      #   #get items data and render list homepage
        @list = @u.get_list
        p "Here's list:"
        p @list
        p 'rendering'
        session[:current_user] = @u.id
        # hello = session[:current_user]
        p "SESSION:"
        p session[:current_user]
        # p hello
        # binding.pry
        render partial: "welcome/main", locals: { user: @u, list: @list}
      end
    end

  end
end
