class HackerController < ApplicationController
  before_action :authenticate_hacker!
  def show
    @hacker = current_hacker
  end
end
