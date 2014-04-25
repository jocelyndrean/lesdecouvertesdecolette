# coding: utf-8
class PagesController < ApplicationController
	def help
		@titre = "Aide"
	end

	def home
		@titre = "Accueil"
	end

	def contact
		@titre = "Contact"
	end

	def about
		@titre = "À Propos"
	end
end
