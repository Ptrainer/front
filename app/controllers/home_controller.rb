# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @partial_sign_in = view_context.render(file: 'users/sessions/new', locals: { resource: User.new })
    @partial_sign_up = view_context.render(file: 'users/registrations/new', locals: { resource: User.new })
  end

  # def erd
  # end
end
