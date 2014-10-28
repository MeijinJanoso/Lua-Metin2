quest kon_lvl_upp begin
	state czytanie begin
	//	when 50050.use begin
			local czas = pc.getqf("czas")
			if horse.get_level()==10 or horse.get_level()==20 then
				say("Informacja")
				say("Przeloguj się by zobaczyć quest")
			elseif horse.get_level()==30 then
				say_title("twój poziom konia jest maxymalny")
				say()
				say_red("Nie wyszkolisz gobardziej")
			else
				if get_time()>= pc.getqf("czas") then
					if number(1, 100) >= 75 then
						pc.remove_item(50050, 1)
						say("Informacja:")
						say_trawa("Nie powiodlo sie")
						say_red("Nastepne szkolenie bedzie mozliwe za 30 min")
						pc.setqf("czas", get_time()+60*30)
					else
						pc.remove_item(50050, 1)
						say_red("Informacja:")
						say_trawa("Poziom twojego konia zostal zwiekszony o 1")
						pc.setqf("czas", get_time()+60*60)
						horse.set_level(horse.get_level()+1)
					end	
				else
					say("Informacja:")
					say("Poziom konia mozesz ulepszac za "..math.floor((czas-get_time())/60+1).." minut ")
				end
			
			end
		end
	end
end	