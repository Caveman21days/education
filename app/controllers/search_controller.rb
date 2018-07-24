class SearchController < ApplicationController

  skip_authorization_check


  def index
    # the results are empty by default
    # if the user has not sent any params
    @search_results = []
    # start searching only if the :model_name is passed
    if params.has_key?(:model_name)
      # get model_type from params
      model_name = params[:model_name]
      # get a symbol (link) to methods
      syms_to_handlers = actions_for_model[model_name]
      # symbol to a method that permits params
      sym_to_permit = syms_to_handlers[0]
      # symbol to a method that received a hash and returns the search results
      sym_to_search = syms_to_handlers[1]

      # permit [params] and convert tham to hash
      search_query = send(sym_to_permit, params).to_hash

      # remove property [name] if it is empty
      # this lets the user not enter the name and search for all projects
      if search_query['name'] == ''
        search_query.delete('name')
      end

      # get the search result
      @search_results = send(sym_to_search, search_query)
    end
  end


  private

  # mapping [model_type] to searching methods (link to them)
  def actions_for_model
    return {
      'Project' => [:projects_params, :search_projects],
      'Field' => [:fields_params, :search_fields],
      'Course' => [:courses_params, :search_courses]
    }
  end

  # -------------
  # projects
  # -------------

  # method that searches for projects
  def search_projects(db_query)
    return Project.where(db_query)
  end

  def projects_params(params)
    return params.permit(:name, :nti,
      :bortnik, :stage, :project_type)
  end

  # -------------
  # fields
  # -------------
  def search_fields(qb_query)
    return Field.where(qb_query)
  end

  def fields_params(params)
    return params.permit(:name)
  end

  # -------------
  # courses
  # -------------
  def search_courses(qb_query)
    return Course.where(qb_query)
  end

  def courses_params(params)
    return params.permit(:name)
  end

end
