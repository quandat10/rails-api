class V1::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    render json:@contacts, status: :ok
  end

  def create
    @contacts = Contact.new(contact_params)
    @contacts.save
    render json:@contacts, status: :created
  end

  def destroy
    @contacts = Contact.where(id: params[:id]).first
    if @contacts.destroy
      head(:ok)
    else
      head(:unprocess_entity)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
