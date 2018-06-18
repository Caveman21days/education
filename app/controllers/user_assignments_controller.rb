class UserAssignmentsController < ApplicationController
  before_action :authenticate_user!
  # authorize_resource
  skip_athorization_check
end