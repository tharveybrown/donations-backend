class ResourceOrgsController < ApplicationController

    def index
        ro = ResourceOrg.all
        render json: ro
    end
end
