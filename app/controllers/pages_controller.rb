class PagesController < ApplicationController
  def privacy
    render layout: 'account'
  end

  def term
    render layout: 'account'
  end
end
