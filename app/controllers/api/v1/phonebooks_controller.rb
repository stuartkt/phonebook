module Api
  module V1
    class PhonebooksController < BaseController
      before_action :authenticate_user!, except: %i[index]
      def index
        @phonebooks = Phonebook.all
        @phonebooks = @phonebooks.search(params[:search]) if params.key? :search

        render json: @phonebooks, root: 'phonebooks'
      end

      def show
        @phonebook = Phonebook.find(params[:id])
        authorize @phonebook

        render json: @phonebook
      end

      def create
        @phonebook = current_user.phonebooks.new(phonebook_params(params))
        if @phonebook.save
          render json: @phonebook
        else
          render_record_invalid_error @phonebook
        end
      end
      def update
        @phonebook = Phonebook.find(params[:id])
        authorize @phonebook
        if @phonebook.update(phonebook_params(params))
          render json: @phonebook
        else
          render_record_invalid_error(@phonebook)
        end
      end

      def destroy
        @phonebook = Collection.find(params[:id])
        authorize @phonebook
        if @phonebook.destroy
          head :no_content
        else
          render_record_invalid_error @phonebook
        end
      end




      def phonebook_params(params)
        params.require(:phonebook).permit(:name)
      end
    end
  end

end
