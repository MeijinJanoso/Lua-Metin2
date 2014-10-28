--[[Quest by Gebel
Zakaz publikowania/sprzedawania/etc.
bez mojej zgody !

GG: 46526993
]]
quest testowanko begin
	state start begin
		when 30122.click begin
			if pc.getqf("czas") >= get_time() then
				minuty = math.floor((pc.getqf("czas")-get_time())/60)
				sekundy = (pc.getqf("czas")-get_time())-minuty*60
				say_title("Duch Sura:")
				say("Twój czas na wejscie do Komnaty")
				say("jeszcze nie minal. Musisz poczekac ")
				say("jeszcze "..minuty.." min. i "..sekundy.." s.")
				say()
				if pc.is_gm() then
					say("Jestes GM !")
					say("Chcesz zresetowac swój czas ?")
					say()
					if select("Tak", "Nie") == 1 then pc.setqf("czas", 0) end
				end
				return
			end
			say_title("Duch Sura:")
			say("Witaj Wielki wojowniku. Widze, ze")
			say("twoja odwaga i mestwo przywiodly")
			say("cie na koniec straszliwej drogi, ale")
			say("to nie konie... To dopiero poczatek !")
			say("Jezeli przyniesiesz mi 3x Krety Klucz")
			say("to otworze przed toba wrota tajemnic i")
			say("pozwole ci wejsc do Smoka. Zabijesz")
			say("go a caly jego lup bedzie twój.")
			say()
			if pc.count_item(30179) >= 3 then
				say("Chcesz wejsc ?")
				say()
				if select("Tak", "Nie") == 1 then
					say_title("Duch Sura:")
					say()
					say("Jestescie gotowi by stawic czola")
					say("Beranowi. Wchodzicie do srodka ?")
					say()
					if select("Tak", "Nie") == 1 then
						pc.remove_item(30179, 3)
						d.join(61)
					end
				end
			else
				say_reward("Przynies mi 3x Krety Klucz !")
				say("Jestes GM")
				say("Chcesz 3 klucze ?")
				if select("Tak", "Nie") == 1 then pc.give_item2(30179, 3) end
			end
		end
		when kill with npc.get_race() == 2493 and party.is_in_dungeon() begin
			if party.is_leader() then
			notice_all("Gracz "..pc.get_name().." pokonal Smoka wraz z grupa.")
				timer("end", 60)
				d.notice("Pozostalo 60 sekund! Spieszcie sie!")
			end
		end
		when end.timer begin
			d.exit_all()
		end
	end
end