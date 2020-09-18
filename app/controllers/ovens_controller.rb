class OvensController < ApplicationController
  before_action :authenticate_user!
  before_action :find_oven, only: [:show, :empty, :refresh]

  def index
    @ovens = current_user.ovens
  end

  def empty
    @oven.cookie.update_attributes!(storage: current_user) if @oven.cookie
    redirect_to @oven, alert: 'Oven emptied!'
  end

  def refresh
    respond_to do |format|
      format.js
    end
  end

  private
    def find_oven
      @oven = current_user.ovens.find_by!(id: params[:id])
    end
end
