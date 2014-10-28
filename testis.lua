quest InGameItemShop begin
	state start begin
		when 20094.chat."Item Shop" begin
			local kategorie = {
				[1] = "PD",
				[2] = "Drop",
				[3] = "Yang",
				[4] = "Zwierzaki",
				[5] = "Wierzchowce",
				[6] = "Kostiumy",
				[7] = "Przepustki",
				[8] = "Fryzury",
				[9] = "Autopotiony",
				[10] = "Pakiety ViP",
				[11] = "Dopalacze",
				[12] = "Anuluj",
			}
			--[[local zmienne = {
				[1] = przedmioty,
				[2] = drop,
				[3] = yang,
				[4] = zwierzaki,
				[5] = wierzchowce,
				[6] = kostiumy,
				[7] = przepustki,
				[8] = ulepszanie,
				[9] = autopotiony,
				[10] = lizaki,
				[11] = inne,
			}			
				if kategoria == 1 then
					kat = {
						-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
						[1] = {"Pierscien Doswiadczenia na 3 dni", "20", "71015", "3"},
						[2] = {"Pierscieñ Doswiadczenia na 7 dni", "40", "71015", "7"},
						[3] = {"Pierscieñ Doswiadczenia na 14 dni", "80", "71015", "14"},
						[4] = {"Pierscieñ Doswiadczenia na 31 dni", "155", "71015", "31"},
						[5] = "Wyjście"
					}	
				--[[elseif kategoria == 2 then
					kat = zmienne[1]
				elseif kategoria == 3 then
					kat = zmienne[1]
				elseif kategoria == 4 then
					kat = zmienne[1]
				elseif kategoria == 5 then
					kat = zmienne[1]
				elseif kategoria == 6 then
					kat = zmienne[1]
				elseif kategoria == 7 then
					kat = zmienne[1]
				elseif kategoria == 8 then
					kat = zmienne[1]
				elseif kategoria == 9 then
					kat = zmienne[1]
				elseif kategoria == 10 then
					kat = zmienne[1]
				elseif kategoria == 11 then
					kat = zmienne[1]]
				end
			--[[local przedmioty = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Pierscien Doswiadczenia na 3 dni", "20", "71015", "3"},
				[2] = {"Pierscieñ Doswiadczenia na 7 dni", "40", "71015", "7"},
				[3] = {"Pierscieñ Doswiadczenia na 14 dni", "80", "71015", "14"},
				[4] = {"Pierscieñ Doswiadczenia na 31 dni", "155", "71015", "31"},
				[5] = {"Rekawica Zlodzieja na 3 dni", "20", "71016", "3"},
				[6] = {"Rekawica Zlodzieja na 7 dni", "40", "71016", "7"},
				[7] = {"Rekawica Zlodzieja na 14 dni", "80", "71016", "14"},
				[8] = {"Rekawica Zlodzieja na 31 dni", "155", "71016", "31"},
				[9] = {"Medal Szczescia na 3 dni", "20", "71017", "3"},
				[10] = {"Medal Szczescia na 7 dni", "40", "71017", "7"},
				[11] = {"Medal Szczescia na 14 dni", "80", "71017", "14"},
				[12] = {"Medal Szczescia na 31 dni", "155", "71017", "31"},
				[13] = {"Bao Bao(Pandzia)", "90", "53009", "1"},
				[14] = {"Knuud (Misio)", "80", "53008", "1"},
				[15] = {"Leonidas (Lewek)", "80", "53010", "1"},
				[16] = {"Ethan (Tygrysek)", "80", "53011", "1"},
				[17] = {"Boczus (Dziczek)", "80", "53012", "1"},
				[18] = {"Rufus (Piesek)", "80", "53013", "1"},
				[19] = {"Medal Konny", "7", "50050", "1"},
				[20] = {"Kon Bojowy", "58", "50039", "1"},
				[21] = {"Renifer", "160", "52090", "1"},
				[22] = {"Dzik Cienia", "85", "71125", "1"},
				[23] = {"Bialt Lew", "75", "71124", "1"},
				[24] = {"Koszulka Pi³karska POL (m)", "45", "41069", "1"},
				[25] = {"Koszulka Pi³karska POL (k)", "45", "41070", "1"},
				[26] = {"Kostium Muszkietera+", "110", "41129", "1"},
				[27] = {"Kostium Pokojówki+", "110", "41130", "1"},
				[28] = {"Strój Salsa+", "110", "41131", "1"},
				[29] = {"Sukienka Salsa+", "110", "41132", "1"},
				[30] = {"Strój D¿entelmena+", "110", "41133", "1"},
				[31] = {"Sukienka Koktajlowa+", "110", "41134", "1"},
				[32] = {"Œwi¹teczny Kostium+ (czerwony)", "110", "41145", "1"},
				[33] = {"Œwi¹teczny Kostium+ (zielony)", "110", "41147", "1"},
				[34] = {"Œwi¹teczny Kostium+ (czarna)", "110", "41149", "1"},
				[35] = {"Œwi¹teczna Sukienia+ (czerwona)", "110", "41146", "1"},
				[36] = {"Œwi¹teczna Sukienia+ (zielona)", "110", "41148", "1"},
				[37] = {"Œwi¹teczna Sukienia+ (czarna)", "110", "41150", "1"},
				[38] = {"Pustynny Bojownik+", "110", "41313", "1"},
				[39] = {"Pustynna Bojowniczka+", "110", "41314", "1"},
				[40] = {"Przepustka", "5", "71095", "1"},
				[41] = {"Krwisty Kamien", "5", "70364", "1"},
				[42] = {"Przepustka ViP", "15, "19", "1"},
				[43] = {"Fryzura Muszkietera +", "85", "45065", "1"},
				[44] = {"Czepek Pokojówki +", "85", "45066", "1"},
				[45] = {"Mini Irokez +", "85", "45067", "1"},
				[46] = {"Kok Salsa +", "85", "45068", "1"},
				[47] = {"Kapelusz Bogarta +", "85", "45069", "1"},
				[48] = {"Kwiecista Fryzura +", "85", "45070", "1"},
				[49] = {"Swiat. Czapa +", "85", "45081", "1"},
				[50] = {"Swiat. Czapa +", "85", "45082", "1"},
				[51] = {"Swiat. Czapa +", "85", "45083", "1"},
				[52] = {"Elficki Kapelusz +", "85", "45084", "1"},
				[53] = {"Maska Kifwebe + (50% expa wiecej)", "185", "45145", "1"},
				[54] = {"Eliksir S³oñca (MEGA)", "130", "72726", "1"},
				[55] = {"Eliksir Ksiê¿yca (MEGA)", "130", "72730", "1"},
				[56] = {"Paczka vip 3 dni", "86", "38052", "3"},
				[57] = {"Paczka vip 7 dni", "166", "38053", "7"},
				[58] = {"Paczka vip 14 dni", "326", "38054", "14"},
				[59] = {"Paczka vip 31 dni", "626", "38055", "31"},
				[60] = {"Kamien Silnej Duszy", "230", "30525", "1"},
				[61] = {"Zaczarownie Przedmiotu x10", "25", "71084", "10"},
				[62] = {"Zaczarownie Przedmiotu x100", "240", "71084", "100"},
				[63] = {"Wzmocnienie Przedmiotu x10", "75", "71085", "10"},
				[64] = {"Rada Pustelnika x1", "20", "71094", "1"},
				[66] = {"Rada Pustelnika x10", "180", "71094", "10"},
				[67] = {"Zwój Egzorcyzmu x1", "8", "71001", "1"},
				[68] = {"Zwój Egzorcyzmu x10", "75", "71001", "10"},
				[69] = {"Atak Boga Smoków x2", "10", "72031", "2"},
				[70] = {"Obrona Boga Smoków x2", "10", "72034", "2"},
				[71] = {"Zycie Boga Smoków x2", "10", "72037", "2"},
				[72] = {"Dlon Krytyka x10", "28", "72046", "10"},
			}]]
			local pr = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Pierscien Doswiadczenia na 3 dni", "20", "71015", "3"},
				[2] = {"Pierscieñ Doswiadczenia na 7 dni", "40", "71015", "7"},
				[3] = {"Pierscieñ Doswiadczenia na 14 dni", "80", "71015", "14"},
				[4] = {"Pierscieñ Doswiadczenia na 31 dni", "155", "71015", "31"},
			}
			--[[local drop = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Rekawica Zlodzieja na 3 dni", "20", "71016", "3"},
				[2] = {"Rekawica Zlodzieja na 7 dni", "40", "71016", "7"},
				[3] = {"Rekawica Zlodzieja na 14 dni", "80", "71016", "14"},
				[4] = {"Rekawica Zlodzieja na 31 dni", "155", "71016", "31"},
			}
			local yang = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Medal Szczescia na 3 dni", "20", "71017", "3"},
				[2] = {"Medal Szczescia na 7 dni", "40", "71017", "7"},
				[3] = {"Medal Szczescia na 14 dni", "80", "71017", "14"},
				[4] = {"Medal Szczescia na 31 dni", "155", "71017", "31"},
			}
			local zwierzaki = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Bao Bao(Pandzia)", "90", "53009", "1"},
				[2] = {"Knuud (Misio)", "80", "53008", "1"},
				[3] = {"Leonidas (Lewek)", "80", "53010", "1"},
				[4] = {"Ethan (Tygrysek)", "80", "53011", "1"},
				[5] = {"Boczus (Dziczek)", "80", "53012", "1"},
				[6] = {"Rufus (Piesek)", "80", "53013", "1"},
			}
			local wierzchowce = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Medal Konny", "7", "50050", "1"},
				[2] = {"Kon Bojowy", "58", "50039", "1"},
				[3] = {"Renifer", "160", "52090", "1"},
				[4] = {"Dzik Cienia", "85", "71125", "1"},
				[5] = {"Bialt Lew", "75", "71124", "1"},
			}
			local kostiumy = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Koszulka Pi³karska POL (m)", "45", "41069", "1"},
				[2] = {"Koszulka Pi³karska POL (k)", "45", "41070", "1"},
				[3] = {"Kostium Muszkietera+", "110", "41129", "1"},
				[4] = {"Kostium Pokojówki+", "110", "41130", "1"},
				[5] = {"Strój Salsa+", "110", "41131", "1"},
				[6] = {"Sukienka Salsa+", "110", "41132", "1"},
				[7] = {"Strój D¿entelmena+", "110", "41133", "1"},
				[8] = {"Sukienka Koktajlowa+", "110", "41134", "1"},
				[9] = {"Œwi¹teczny Kostium+ (czerwony)", "110", "41145", "1"},
				[10] = {"Œwi¹teczny Kostium+ (zielony)", "110", "41147", "1"},
				[11] = {"Œwi¹teczny Kostium+ (czarna)", "110", "41149", "1"},
				[12] = {"Œwi¹teczna Sukienia+ (czerwona)", "110", "41146", "1"},
				[13] = {"Œwi¹teczna Sukienia+ (zielona)", "110", "41148", "1"},
				[14] = {"Œwi¹teczna Sukienia+ (czarna)", "110", "41150", "1"},
				[15] = {"Pustynny Bojownik+", "110", "41313", "1"},
				[16] = {"Pustynna Bojowniczka+", "110", "41314", "1"},
			}
			local przepustki = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Przepustka", "5", "71095", "1"},
				[2] = {"Krwisty Kamien", "5", "70364", "1"},
				[3] = {"Przepustka ViP", "15", "19" , "1"},
			}
			local ulepszanie = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Fryzura Muszkietera +", "85", "45065", "1"},
				[2] = {"Czepek Pokojówki +", "85", "45066", "1"},
				[3] = {"Mini Irokez +", "85", "45067", "1"},
				[4] = {"Kok Salsa +", "85", "45068", "1"},
				[5] = {"Kapelusz Bogarta +", "85", "45069", "1"},
				[6] = {"Kwiecista Fryzura +", "85", "45070", "1"},
				[7] = {"Swiat. Czapa +", "85", "45081", "1"},
				[8] = {"Swiat. Czapa +", "85", "45082", "1"},
				[9] = {"Swiat. Czapa +", "85", "45083", "1"},
				[10] = {"Elficki Kapelusz +", "85", "45084", "1"},
				[11] = {"Maska Kifwebe + (50% expa wiecej)", "185", "45145", "1"},
			}
			local autopotiony = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Eliksir S³oñca (MEGA)", "130", "72726", "1"},
				[2] = {"Eliksir Ksiê¿yca (MEGA)", "130", "72730", "1"},
			}
			local lizaki = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Paczka vip 3 dni", "86", "38052", "3"},
				[2] = {"Paczka vip 7 dni", "166", "38053", "7"},
				[3] = {"Paczka vip 14 dni", "326", "38054", "14"},
				[4] = {"Paczka vip 31 dni", "626", "38055", "31"},
			}
			local inne = {
				-- Nazwa Przedmiotu, Cena, Id Przedmiotu, Ilosc
				[1] = {"Kamien Silnej Duszy", "230", "30525", "1"},
				[2] = {"Zaczarownie Przedmiotu x10", "25", "71084", "10"},
				[3] = {"Zaczarownie Przedmiotu x100", "240", "71084", "100"},
				[4] = {"Wzmocnienie Przedmiotu x10", "75", "71085", "10"},
				[5] = {"Rada Pustelnika x1", "20", "71094", "1"},
				[6] = {"Rada Pustelnika x10", "180", "71094", "10"},
				[7] = {"Zwój Egzorcyzmu x1", "8", "71001", "1"},
				[8] = {"Zwój Egzorcyzmu x10", "75", "71001", "10"},
				[9] = {"Atak Boga Smoków x2", "10", "72031", "2"},
				[10] = {"Obrona Boga Smoków x2", "10", "72034", "2"},
				[11] = {"Zycie Boga Smoków x2", "10", "72037", "2"},
				[12] = {"Dlon Krytyka x10", "28", "72046", "10"},
			}]]]]
			
			local zapytanie = query("SELECT coins FROM account.account WHERE id = '"..pc.get_account_id().."';")
			pc.setqf("iloscSM", zapytanie)
			local iloscSM = pc.getqf("iloscSM")
			say_title(mob_name(npc.get_race())..":")
			say()
			say("Witaj "..pc.get_name())
			say("Jezeli chcesz Item Shopu")
			say("to dobrze trafiles.")
			say()
			say_reward("Chcesz z niego skorzystac ?")
			say()
			if select("Tak", "Nie") == 1 then
				say_size(350, 400)
				say_title("Item Shop:[ENTER]")
				say("Posiadasz "..iloscSM.." SM !")
				say("Wybierz Kategorie:[ENTER]")
				local kategoria = select_table(kategorie)
				local k = number(table.getn(pr))
				if kategoria == 12 then
					return
				end
				say_size(350, 400)
				if kategoria == 1 then
					say("Kategoria PD:"..k.." ")
					say()
					say("Posiadasz "..iloscSM.." SM !")
					say()
					local katSel = select_table(pr[1])
					if katSel == 5 then
						return
					end
				end
			end	
		end
	end
end				
