module Api
  module V1
    class ContactsController < BaseController
      before_action :authenticate_user!
      before_action :phonebook, only: %i[index create]

      def index
        @contacts = @phonebook.contacts
        @contacts = @contacts.search(params[:search]) if params.key? :search

        render json: @contacts
      end

      def create
        @contact = @phonebook.contacts.new(contact_params(params))

        authorize @contact

        if @contact.save
          render json: @contact
        else
          render_record_invalid_error @contact
        end
      end

      def update
        @contact = Contact.find(params[:id])
        authorize @contact
        if @contact.update(contact_params(params))
          render json: @contact
        else
          render_record_invalid_error @contact
        end
      end

      def destroy
        @contact = Contact.find(params[:id])

        authorize @contact

        if @contact.destroy
          head :no_content
        else
          render_record_invalid_error @contact
        end
      end

      def show
        @contact = Contact.find(params[:id])
        authorize @contact

        render json: @contact
      end

      private

      def phonebook
        @phonebook = Phonebook.find(params[:phonebook_id])
      end

      def contact_params(params)
        params.require(:contact).permit(
          :name,
          phone_numbers_attributes: %i[id phone_number phone_type _destroy],
          emails_attributes: %i[id address email_type _destroy],
          address_attributes:
              %i[id property_number street_name city area_code country _destroy]
        )
      end
    end
  end
end
