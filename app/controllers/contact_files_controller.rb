class ContactFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact_files = current_user.contact_files.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @contact_file = ContactFile.find_by(id: params[:id])

    if @contact_file.nil?
      flash[:error] = "Contact file not found."
      redirect_to contact_files_path
    end
  end
end
