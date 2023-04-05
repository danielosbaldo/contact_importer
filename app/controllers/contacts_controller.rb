class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts.order(created_at: :desc).page(params[:page])
  end

  def new
    @contact_file = ContactFile.new
  end

  def create
    @contact_file = current_user.contact_files.build(contact_file_params.merge(status: 'on_hold'))

      if @contact_file.save
        CsvImportJob.perform_later(@contact_file.id, current_user.id)
        redirect_to contacts_path, notice: 'Contacts import has started. Please refresh the page to see the results.'
      else
        render :new
      end
  end

  private

  def contact_file_params
    params.require(:contact_file).permit(:file_name, :file)
  end
end
