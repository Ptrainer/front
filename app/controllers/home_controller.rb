# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    puts 'coucou'
    @partial_sign_in = view_context.render(file: 'users/sessions/new', locals: { resource: User.new })
  end

  # def erd
  # end
end
