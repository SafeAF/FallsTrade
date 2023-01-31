class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
  end

  def index

  end

  def update
  @profile = Profile.find(params[:id])
  if @profile.update(profile_params)
    redirect_to @profile, notice: "Profile updated successfully!"
  else
    render :edit
  end
end


  def profile_params
    params.require(:profile).permit(:id)
  end
end
