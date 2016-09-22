require 'action_dispatch/routing/inspector'

class HtmlController < ApplicationController
  def index
  end
  
  def routes
    if path = params[:path]
      path = URI.parser.escape path
      normalized_path = with_leading_slash path
      render json: {
        exact: match_route {|it| it.match normalized_path },
        fuzzy: match_route {|it| it.spec.to_s.match path }
      }
    else
      @routes_inspector = ActionDispatch::Routing::RoutesInspector.new(_routes.routes)
      @page_title = 'Routes'
    end
  end


end
