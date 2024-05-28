# frozen_string_literal: true

require 'roda'
require_relative './app'

module Cryal
  # Base class for Credence Web Application
  class App < Roda
    route('account') do |routing|
      # puts @current_account
      # @account_name = @current_account['username']
      # routing.on @account_name do
      #   if @current_account
      #       view :account_page, locals: { current_account: @current_account }
      #     else
      #       routing.redirect '/auth/login'
      #     end
      # end

      routing.post String do |rt|
        puts "ini masuk"
        puts routing.params['password']
        puts routing.params['confirmpassword']
        raise 'Passwords do not match or empty' if
          routing.params['password'].empty? ||
          routing.params['password'] != routing.params['confirmpassword']

        new_account = SecureMessage.decrypt(rt)
        CreateAccount.new(App.config).call(
          email: new_account['email'],
          username: new_account['username'],
          password: routing.params['password']
        )
        flash[:notice] = 'Account created! Please login'
        routing.redirect '/auth/login'
      end
    end
  end
end
