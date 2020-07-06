class EntitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :website
end
