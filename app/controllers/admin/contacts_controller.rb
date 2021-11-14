class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.paginate(page: params[:page], per_page: 4)
  end

  def update
    @contact = Contact.find(params[:contact_id])
    if @contact.have_replied == false || @contact.have_replied.nil?
      @contact.update(have_replied: true)
    else
      @contact.update(have_replied: false)
    end

    redirect_back(fallback_location: request.referer)
  end
end
