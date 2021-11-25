class ContactsController < ApplicationController
  before_action :require_login

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "質問を送りました！"
    else
      flash[:error] = "質問を送信できませんでした。"
    end
    redirect_back(fallback_location: request.referer, anchor: "contact")
  end

  private
  def contact_params
    params.require(:contact).permit(:user_id, :content, :email)
  end
end
