class ShotsController < ApplicationController
  load_and_authorize_resource except: :shared
  before_action :set_shot, only: [:show, :destroy, :shared]

  # GET /shots
  def index
    @shots = current_user.shots.paginate(page: params[:page])
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

  def shared
    # set_layout :simple
    render layout: 'simple'
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
