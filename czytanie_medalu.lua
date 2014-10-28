quest kon_lv_up begin
	state start begin
		when 50050.use begin
			if horse.get_level() == 10 then
				set_state(informacja)
			elseif horse.get_level() == 20 then
				set_state(informacja2)
			elseif horse.get_level() == 30 then
				say_title("twój poziom konia jest maxymalny")
				say()
				say_red("Nie wyszkolisz gobardziej")
			elseif horse.get_level() < 10 or horse.get_level() > 21 or horse.get_level() < 30 then
				set_state(czytanie)
			end
		end	
	end
	state informacja begin					
		when letter begin
			local v = find_npc_by_vnum(20355)
			if v != 0 then
				target.vid("__TARGET__", v, "Misja na 11 lvl konia")
			end
			send_letter("Misja na 11 lvl konia")
		end
		when button or info begin
			say_title("Misja na 11 lvl konia")
			say()
			say("Stajenny polecil Kapitanowi wyszkolic poziom twojego konia")
			say("Udaj sie do Kapitana po dalsze informacje")
			say()
			say_reward("Kapitana znajdziesz w Mieœcie! ")
		end
		when __TARGET__.target.click or 20355.chat."Misja na 11 lvl konia" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Stajenny polecil mi wyszkolic cie ")
			say("w walce na koniu... ")
			say("najpierw udowodnij mi ze sie do tego nadajesz")
			say("Udowodnisz mi to zabijajac 100 ")
			say("Czarnych orków w 40 minut")
			say("Powodzenia!")
			local b=select("Tak", "Nie")
			if 1==b then
				set_state(misjakon)
				pc.setqf("kon11", 1)
				pc.remove_item(50050, 1)
			else
				return
			end
		end
	end	
	state misjakon begin
		when letter begin
			send_letter("Misja na 11 lvl konia")
		end
		when button or info begin
			say_title("Misja na 11 lvl konia")
			say("Kapitan prosi Ciê, abyœ zabi³ ")
			say("100 czarnych orków spiesz sie masz 40 minut ")
			say("Znajdziesz je w smoczej dolinie")
		end
		when 636.kill or 637.kill with pc.getqf("kon11") == 1 begin
			if pc.getqf("kon1m") == 99 then
				pc.setqf("kon1m", pc.getqf("kon1m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("kon1m").." z 100 czarnych orków.")
				set_state(powrot)
				pc.delqf("kon1m")
			else
				pc.setqf("kon1m", pc.getqf("kon1m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("kon1m").." z 100 czarnych orków.")
			end
		end
	end
	state powrot begin
		when letter begin
			local v = find_npc_by_vnum(20355)
			if v != 0 then
				target.vid("__TARGET__", v, "Misja na 11 lvl konia")
			end
			send_letter("Misja na 11 lvl konia")
		end
		when button or info begin
			say_title("Misja na 11 lvl konia")
			say("Gratulacje! ")
			say("Uda³o Ci siê zabiæ 100 czarnych orków. ")
			say("Udaj siê teraz do Kapitana aby odebraæ ")
			say("nagrodê!")
		end
		when __TARGET__.target.click or 20355.chat."Misja na 11 lvl konia" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Stajenny sie nie mylil")
			say("Jestes godzien walczyc na koniu ")
			say("mam nadzieje ze dobrze to wykozystasz. ")
			say()
			horse.set_level(11)
			set_state(__complete1)
			notice("Otrzymales 11 lvl konia")
		end
	end
	state __complete1 begin
	end
	state informacja2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
			if v != 0 then
				target.vid("__TARGET__", v, "Misja na 21 lvl konia")
			end
			send_letter("Misja na 21 lvl konia")
		end
		when button or info begin
			say_title("Misja na 21 lvl konia")
			say()
			say("Stajenny polecil Kapitanowi wyszkolic poziom twojego konia")
			say("Udaj sie do Kapitana po dalsze informacje")
			say()
			say_reward("Kapitana znajdziesz w Mieœcie! ")
		end
		when __TARGET__.target.click or 20355.chat."Misja na 21 lvl konia" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Stajenny polecil mi wyszkolic cie ")
			say("w uzywaniu magi na koniu... ")
			say("najpierw udowodnij mi ze sie do tego nadajesz")
			say("Udowodnisz mi to zabijajac 300 ")
			say("Lodowych golemów w 40 minut")
			say("Powodzenia!")
			local b=select("Tak", "Nie")
			if 1==b then
				set_state(misjakon2)
				pc.setqf("kon21", 1)
				pc.remove_item(50050, 1)
			else
				return
			end
		end
	end	
	state misjakon2 begin
		when letter begin
			send_letter("Misja na 21 lvl konia")
		end
		when button or info begin
			say_title("Misja na 21 lvl konia")
			say("Kapitan prosi Ciê, abyœ zabi³ ")
			say("300 Lodowych Golemów spiesz sie masz 40 minut ")
			say("Znajdziesz je na Sochan")
		end
		when 1107.kill with pc.getqf("kon21") == 1 begin
			if pc.getqf("kon21m") == 299 then
				pc.setqf("kon21m", pc.getqf("kon21m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("kon21m").." z 300 Lodowych Golemów.")
				set_state(powrot2)
				pc.delqf("kon21m")
			else
				pc.setqf("kon21m", pc.getqf("kon21m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("kon21m").." z 300 Lodowych Golemów.")
			end
		end
	end
	state powrot2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
			if v != 0 then
				target.vid("__TARGET__", v, "Misja na 21 lvl konia")
			end
			send_letter("Misja na 21 lvl konia")
		end
		when button or info begin
			say_title("Misja na 21 lvl konia")
			say("Gratulacje! ")
			say("Uda³o Ci siê zabiæ 300 Lodowych Golemów. ")
			say("Udaj siê teraz do Kapitana aby odebraæ ")
			say("nagrodê!")
		end
		when __TARGET__.target.click or 20355.chat."Misja na 21 lvl konia" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Stajenny sie nie mylil")
			say("Jestes godzien walczyc na koniu ")
			say("mam nadzieje ze dobrze to wykozystasz. ")
			say()
			horse.set_level(21)
			set_state(__complete)
		end
	end
	state __complete begin
	end
	state czytanie begin
		when 50050.use begin
			local czas = pc.getqf("czas")
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