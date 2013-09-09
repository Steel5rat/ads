module AdsHelper
	def getAdsTypes ads_types		
		types = []
		ads_types.each do |t|
			types << [t.name, t.id]
		end
		types
		#ads_types[0]<<adstypes[1]
	end
	
	def getNameOfType types, id	
		types.each do |type|
			if type[:id] == id
				return type[:name]
			end
		end
	end
end
