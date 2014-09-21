class ContactsController < ApplicationController
	before_action :load_contact, only: [:show, :edit, :update, :destroy]
	before_action :ensure_logged_in

	def index
		@contacts = current_user.contacts.all
		
		if @contacts.empty?
			redirect_to new_contact_path
		end
	end

	def show	
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.user_id = current_user.id 

		if @contact.save
			redirect_to contacts_path
		else 
			render :new
		end
	end

	def edit
	end

	def update
		if @contact.update(contact_params)
			redirect_to contacts_path
		else
			render :edit
		end
	end

	def destroy
		@contact.destroy
		redirect_to movies_path
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :number, :email, :twitter, :notes)
	end

	def load_contact
		@contact = Contact.find(params[:id])
	end
end
