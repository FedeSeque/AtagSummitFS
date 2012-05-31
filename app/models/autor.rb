class Autor < ActiveRecord::Base
	has_many :articulos
	validates_presence_of :usuario, :nombre
	validates_uniqueness_of :usuario
end
