class ProfilesController < ApplicationController

  before_action :find_profile, only: [:update, :edit]

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to root_path, notice: "プロフィール登録が完了しました"
    else
      render :new
    end
  end

  def update
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :detail, :image)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
