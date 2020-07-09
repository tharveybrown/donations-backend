class EntitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :website
end
