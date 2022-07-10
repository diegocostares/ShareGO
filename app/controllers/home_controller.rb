class HomeController < ApplicationController
  def index
    @publications = Publication.all
  end
end
