module Api
  module V1
    class CoursesController < Api::V1::BaseController
      def show
        #resources = resource_class.includes(:teacher, :department)
        #                    .page(page_params[:page])
        #                    .per(page_params[:page_size])

        #instance_variable_set("@#{resource_name}", resources)
        #respond_with instance_variable_get("@#{resource_name}")
        respond_with get_resource
      end

      # GET /api/{plural_resource_name}
      def index
        plural_resource_name = "@#{resource_name.pluralize}"
        resources = resource_class.name_like(params[:name])
                            .where(query_params)
                            .page(page_params[:page])
                            .per(page_params[:page_size])

        instance_variable_set(plural_resource_name, resources)
        respond_with instance_variable_get(plural_resource_name)
      end


      private

        def query_params
          # this assumes that an album belongs to an artist and has an :artist_id
          # allowing us to filter by this
          params.permit(:code, :credit, :course_category_id, :department_id, :teacher_id)
        end
    end
  end
end