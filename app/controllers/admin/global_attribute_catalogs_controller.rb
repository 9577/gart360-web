class Admin::GlobalAttributeCatalogsController < Admin::BaseController
		private
		
		def permitted_params
		  params.permit!
		end
end
