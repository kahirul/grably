class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :destroy]

  # GET /shots
  def index
    @shots = current_user.shots
  end

  # GET /shots/1
  def show
  end

  def shot
    shot = current_user.shots.build
    shot.url = params[:shot][:url]
    shot.save
    shot.grab

    redirect_to shots_url, notice: 'Shot was successfully put on queue'
  end

  # DELETE /shots/1
  def destroy
    @shot.destroy
    redirect_to shots_url, notice: 'Shot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

end
