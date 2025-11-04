module Api
  module V1
    class AgreementsController < ApplicationController
      protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token

      before_action :set_organization

      def create
        unless @organization
          return render json: { error: "Invalid API key" }, status: :unauthorized
        end

        agreement = Agreement.new(agreement_params)

        if agreement.save
          attach_documents(agreement)
          render json: { message: "Agreement created successfully", id: agreement.id }, status: :created
        else
          render json: { errors: agreement.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_organization
        @organization = Organization.find_by(api_key: params[:api_key])
      end

      def agreement_params
        {
          organization_id: @organization.id,
          number: params[:number],
          client_identification_no: params[:iin]
        }
      end

      def attach_documents(agreement)
        return unless params[:documents].present?

        params[:documents].each do |doc|
          next if doc[:data].blank?

          begin
            decoded_file = Base64.decode64(doc[:data])
            io = StringIO.new(decoded_file)
            agreement.documents.attach(
              io: io,
              filename: doc[:filename],
              content_type: doc[:content_type]
            )
          rescue => e
            Rails.logger.error("Failed to attach document: #{e.message}")
          end
        end
      end
    end
  end
end
