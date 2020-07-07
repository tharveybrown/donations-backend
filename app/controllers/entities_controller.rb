class EntitiesController < ApplicationController
  private
    
  def entity_params
    params.require(:entity).permit( 
      :name,
      :website
    )
  end
end
