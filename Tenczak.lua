--[[Quest by Janos(mój 1 quest  xD ) and Gabel(thx za 1 wersje tego questa :) ) 
Zakaz publikowania/sprzedawania/etc.
bez mojej zgody !

GG: 46526993(Gabel) 8450501 ( Janos) 
]]
quest czak begin
	state start begin
		when 30525.use begin
			k = (pc.get_job ()+1)
			if pc.get_skill_group() == 0 then
				say("Nie wybra³eœ jeszcze swojej drogi")
				say("umiejêtnoœci. Leæ wybraæ j¹ u")
				say("Instuktora na placu w M1.")
				say()
			else 
			
			local c = pc.get_skill_group()
			--local klasa =  {
				--[1] = {"wojo"},
			--	[2] = {"ninja"},
		--		[3] = {"sura"},
		--		[4] = {"szaman"},
	--		}

				
				if pc.get_job() == 0 then
					s = (c+0)
				elseif pc.get_job() == 1 then
					s = (c+2)
				elseif pc.get_job() == 2 then
					s = (c+4)
				elseif pc.get_job() == 3 then
					s = (c+6)
				end	
				local nazwa = {
					[1] = {"Trzystronne Ciêcie", "Wir Miecza", "Berserk", "Aura Miecza", "Szar¿a", 0},
					[2] = {"Duchowe Uderzenie", "Walniêcie", "T¹pniêcie", "Silne Cia³o", "Uderzenie Miecza", 15},
					[3] = {"Zasadzka", "Szybki Atak", "Wiruj¹cy Sztylet", "Krycie Siê ", "Truj¹ca Chmura", 30},
					[4] = {"Powtarzalny Strza³ ", "Deszcz Strza³ ", "Ognista Strza³a", "Bezszelestny Chód", "Truj¹ca Strza³a", 45},
					[5] = {"Uderzenie Palcem", "Smoczy Wir", "Czarowane Ostrze", "Strach", "Czarowana Zbroja", "Rozproszenie Magii", 60},
					[6] = {"Mroczne Uderzenie", "Ogniste Uderzenie", "Ognisty Duch", "Mroczna Ochrona", "Duchowy Cios", "Mroczna Sfera", 75},
					[7] = {"Lataj¹cy Talizman", "Strzelaj¹cy Smok", "Smoczy Skowyt", "B³ogos³awieñstwo", "Odbicie", "Pomoc Smoka", 90},
					[8] = {"B³yskawiczny Rzut", "Przywo³anie B³yskawicy", "Burzowy Szpon", "Leczenie", "Zwinnoœæ ", "Zwiêkszenie Ataku", 105 },
				}	
				say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
				say()
				say_pink("Wybierz Umiejêtnoœæ, któr¹ chcesz wyszkoliæ ")
				say_pink("do poziomu Perfect Master  !" )
				say()
				if pc.get_job() >= 0 and pc.get_job () <= 2 then
					local wybor = select(nazwa[s][1], nazwa[s][2], nazwa[s][3], nazwa[s][4], nazwa[s][5], "Wyjœcie")
					if wybor == 6 then
						return
					else	
						if pc.get_skill_level(nazwa[s][6] + wybor) >= 30 and pc.get_skill_level(nazwa[s][6] + wybor) < 40 then
							pc.set_skill_level(nazwa[s][6] + wybor, 59)
							chat("Pomyœlnie wyszkoli³eœ Umiejêtnoœæ na Poziom Perfect Master !")
							pc.remove_item(30525, 1)
						else	
							if pc.get_skill_level(nazwa[s][6]+wybor) == 40 then
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_pink("Ta Umiejêtnoœæ jest ju¿ na poziomie Perfect !")
								say()
							else
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_trawa("Nie mozesz wyszkolic tej umiejetnosci...")
								say_trawa("Jest ona na zaniskim poziomie...")
								say_trawa("Aby móc uzywac Kamienia Silnej Duszy.")
								say_trawa("Musisz wyszkolic  "..nazwa[s][wybor].." na poziom")
								say()
								say()
								say(" "..color256(88, 245, 250).. "                ...###..G1..###...")
								say()
								say()
								say_trawa("Mozesz to uczynic czytajac ksziegi umiejetnosci")
								say_trawa("twojej profesji. Powodzenia")
							end	
						end	
					end
				elseif pc.get_job()	>= 3 and pc.get_job() <= 4 then 	
					local wybor = select(nazwa[s][1], nazwa[s][2], nazwa[s][3], nazwa[s][4], nazwa[s][5], nazwa[s][6], "Wyjœcie")
					if wybor == 7 then
						return
					else	
						if pc.get_skill_level(nazwa[s][7] + wybor) >= 30 and pc.get_skill_level(nazwa[s][7] + wybor) < 40 then
							pc.set_skill_level(nazwa[s][7]+wybor, 59)
							chat("Pomyœlnie wyszkoli³eœ Umiejêtnoœæ na Poziom Perfect Master !")
							pc.remove_item(30525, 1)
						else	
							if pc.get_skill_level(nazwa[s][7]+wybor) == 40 then
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_pink("Ta Umiejêtnoœæ jest ju¿ na poziomie Perfect !")
								say()
							else
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_trawa("Nie mozesz wyszkolic tej umiejetnosci...")
								say_trawa("Jest ona na zaniskim poziomie...")
								say_trawa("Aby móc uzywac Kamienia Silnej Duszy.")
								say_trawa("Musisz wyszkolic  "..nazwa[s][wybor].." na poziom")
								say()
								say()
								say(" "..color256(88, 245, 250).. "                ...###..G1..###...")
								say()
								say()
								say_trawa("Mozesz to uczynic czytajac ksziegi umiejetnosci")
								say_trawa("twojej profesji. Powodzenia")
							end	
						end
					end
				end
			end
		end
	end
end
	