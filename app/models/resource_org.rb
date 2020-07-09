# require 'byebug'
class ResourceOrg < ApplicationRecord
  
  def self.create_from_collection(orgs)
    orgs.each do |org|
      ResourceOrg.create(org)
    end
  end

end
