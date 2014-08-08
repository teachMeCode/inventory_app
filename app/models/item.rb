class Item
  include Mongoid::Document
  field :user_id, type: Integer
  field :item_cd, type: String
  field :medium, type: String
  field :theme, type: String
  field :size, type: String
  field :title, type: String
  field :status, type: String
  field :location, type: String
  field :dt_finished, type: Date
end
