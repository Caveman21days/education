class SearchController < ApplicationController

  skip_authorization_check

  def index
    print('lol')
  end

  def search_projects
    print project_search_params
  end

  private

  def project_search_params
    params.require(:project).permit(:name)
  end
end
