class ApiController < ApplicationController

	def dump
    request.format = :json
    command = params[:element].try(:to_sym)

    respond_to do |format|
      format.json do
        render json: helpers.dump(command).as_json
      end
    end

	end

  def info
    request.format = :json
    element = params[:element]

    respond_to do |format|
      format.json do
        if element.present?
          render json: helpers.info(element).as_json
        else
          render json: {
            error: "Expecting 'element' parameter in the URL"
          }
        end
      end
    end
  end

  def export
    respond_to do |format|
      format.text do
        render text: helpers.export
      end
      format.json do
        render json: helpers.export(:json).as_json
      end
    end
  end

  def export_all
    respond_to do |format|
      format.text do
        render text: helpers.export_all
      end
      format.json do
        render json: helpers.export_all(:json).as_json
      end
    end
  end
end
