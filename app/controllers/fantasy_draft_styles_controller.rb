class FantasyDraftStylesController < ApplicationController

  def index
    render json: FantasyDraftStyle.all, status: 200
  end

  def show
    render json: FantasyDraftStyle.find_by_id(params['id']), status: 200
  end
end