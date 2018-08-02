class Api::V1::LeaderboardsController < ApplicationController
  before_action :find_leaderboard, only: [:update, :show ]
def index
  @leaderboards = Leaderboard.all
  render json: @leaderboards
end

def new
  @leaderboard = Leaderboard.new
end

def create
  @leaderboard = Leaderboard.new(leaderboard_params)
  respond_to do |format|
    if @leaderboard.save
      format.html { redirect_to @leaderboard, notice: "Leaderboard successfully created"}
      format.json { render :show, status: :created, location: @leaderboard  }
    else
      format.html { render :new}
      format.json { render json: @leaderboard.errors, status: :unprocessible_entity}
    end
  end
end

def show
  render json: @leaderboard
end
def update
  @leaderboard.update(leaderboard_params)
  if @leaderboard.save
    render json: @leaderboard, status: :accepted
  else
    render json: { errors: @leaderboard.errors.full_messages }, status: :unprocessible_entity
  end
end

private

def leaderboard_params
  params.permit(:user_name, :score)
end

def find_leaderboard
  @leaderboard = Leaderboard.find(params[:id])
end
end
