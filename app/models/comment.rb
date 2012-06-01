class Comment < ActiveRecord::Base
  belongs_to :articulo
  validates_presence_of :comentador, :cuerpo
end
