namespace :pubarch do

  task :publish => :environment do
	ads = Ad.all
	ads.each do |ad|
		if ad.status == 4
			ad.status = 5
			ad.save
		end
	end
  end

  task :archive => :environment do
	ads = Ad.all
	ads.each do |ad|
		if ad.status == 5
			dif = (Time.now - ad.updated_at)/60/60/24 #to days
				if dif > 2
					ad.status = 6
					ad.save
				end
		end
	end
  end

end
