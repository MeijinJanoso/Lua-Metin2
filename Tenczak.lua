--[[Quest by Janos(m�j 1 quest  xD ) and Gabel(thx za 1 wersje tego questa :) ) 
Zakaz publikowania/sprzedawania/etc.
bez mojej zgody !

GG: 46526993(Gabel) 8450501 ( Janos) 
]]
quest czak begin
	state start begin
		when 30525.use begin
			k = (pc.get_job ()+1)
			if pc.get_skill_group() == 0 then
				say("Nie wybra�e� jeszcze swojej drogi")
				say("umiej�tno�ci. Le� wybra� j� u")
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
					[1] = {"Trzystronne Ci�cie", "Wir Miecza", "Berserk", "Aura Miecza", "Szar�a", 0},
					[2] = {"Duchowe Uderzenie", "Walni�cie", "T�pni�cie", "Silne Cia�o", "Uderzenie Miecza", 15},
					[3] = {"Zasadzka", "Szybki Atak", "Wiruj�cy Sztylet", "Krycie Si� ", "Truj�ca Chmura", 30},
					[4] = {"Powtarzalny Strza� ", "Deszcz Strza� ", "Ognista Strza�a", "Bezszelestny Ch�d", "Truj�ca Strza�a", 45},
					[5] = {"Uderzenie Palcem", "Smoczy Wir", "Czarowane Ostrze", "Strach", "Czarowana Zbroja", "Rozproszenie Magii", 60},
					[6] = {"Mroczne Uderzenie", "Ogniste Uderzenie", "Ognisty Duch", "Mroczna Ochrona", "Duchowy Cios", "Mroczna Sfera", 75},
					[7] = {"Lataj�cy Talizman", "Strzelaj�cy Smok", "Smoczy Skowyt", "B�ogos�awie�stwo", "Odbicie", "Pomoc Smoka", 90},
					[8] = {"B�yskawiczny Rzut", "Przywo�anie B�yskawicy", "Burzowy Szpon", "Leczenie", "Zwinno�� ", "Zwi�kszenie Ataku", 105 },
				}	
				say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
				say()
				say_pink("Wybierz Umiej�tno��, kt�r� chcesz wyszkoli� ")
				say_pink("do poziomu Perfect Master  !" )
				say()
				if pc.get_job() >= 0 and pc.get_job () <= 2 then
					local wybor = select(nazwa[s][1], nazwa[s][2], nazwa[s][3], nazwa[s][4], nazwa[s][5], "Wyj�cie")
					if wybor == 6 then
						return
					else	
						if pc.get_skill_level(nazwa[s][6] + wybor) >= 30 and pc.get_skill_level(nazwa[s][6] + wybor) < 40 then
							pc.set_skill_level(nazwa[s][6] + wybor, 59)
							chat("Pomy�lnie wyszkoli�e� Umiej�tno�� na Poziom Perfect Master !")
							pc.remove_item(30525, 1)
						else	
							if pc.get_skill_level(nazwa[s][6]+wybor) == 40 then
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_pink("Ta Umiej�tno�� jest ju� na poziomie Perfect !")
								say()
							else
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_trawa("Nie mozesz wyszkolic tej umiejetnosci...")
								say_trawa("Jest ona na zaniskim poziomie...")
								say_trawa("Aby m�c uzywac Kamienia Silnej Duszy.")
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
					local wybor = select(nazwa[s][1], nazwa[s][2], nazwa[s][3], nazwa[s][4], nazwa[s][5], nazwa[s][6], "Wyj�cie")
					if wybor == 7 then
						return
					else	
						if pc.get_skill_level(nazwa[s][7] + wybor) >= 30 and pc.get_skill_level(nazwa[s][7] + wybor) < 40 then
							pc.set_skill_level(nazwa[s][7]+wybor, 59)
							chat("Pomy�lnie wyszkoli�e� Umiej�tno�� na Poziom Perfect Master !")
							pc.remove_item(30525, 1)
						else	
							if pc.get_skill_level(nazwa[s][7]+wybor) == 40 then
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_pink("Ta Umiej�tno�� jest ju� na poziomie Perfect !")
								say()
							else
								say_title(" "..color256(88, 245, 250).."Kamien Silnej Duszy:")
								say()
								say_trawa("Nie mozesz wyszkolic tej umiejetnosci...")
								say_trawa("Jest ona na zaniskim poziomie...")
								say_trawa("Aby m�c uzywac Kamienia Silnej Duszy.")
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
	