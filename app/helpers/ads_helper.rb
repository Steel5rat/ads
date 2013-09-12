module AdsHelper
	def getAdsTypes ads_types		
		types = []
		if ads_types != nil
			ads_types.each do |t|
			types << [t.name, t.id]
			end		
		end		
		types
	end
	
	def getNameOfType types, id	
		types.each do |type|
			if type[:id] == id
				return type[:name]
			end
		end
	end
end
