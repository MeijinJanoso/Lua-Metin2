quest fabula2 begin
	state start begin
	end

	state run begin
		when login or levelup with pc.level >= 25 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Niszczycielska Magia")
				end
			send_letter("Niszczycielska Magia")
		end

		when button or info begin
			say_title("Niszczycielska Magia")
			say()
			say("Kapitan stwierdzil ze jestes juz wystarczajaco")
			say("doswiadczony, aby mógl powierzyc Ci kolejne")
			say("zadanie. Idz do niego czym predzej i dowiedz")
			say("sie o co chodzi. ")
			say_reward("powodzenia!")
		end

		when __TARGET__.target.click or 20355.chat."Niszczycielska Magia" begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Witaj, jak milo ze jednak przyszedles! ")
			say("Pozwól ze opowiem Ci pewna historie..")
			wait()
			say_title("Kapitan:")
			say("Dawnymi czasy, gdy krajem wladal ")
			say("Legendarny Nyx, najsilniejsze z dobrych bustw,")
			say("nasza rasa byla najsilniejsza. Zadne trolle ani ")
			say("orki nie mialy wystarczajaco sil by nas pokonac!")
			say("Lecz pewnego dnia to sie zmienilo..")
			wait()
			say_title("Kapitan:")
			say("Okolo dwa tysiace lat temu niebo stalo sie czarne,")
			say("a z nieba zaczely spadac kamienie. Spadly ich ")
			say("setki tysiecy a moze nawet miliony! Od dluzszego")
			say("czasu staramy sie zaradzic tej okropnej pladze, ")
			say("lecz niestety nie same kamienie trzeba zniszczyc.")
			say("Bronia ich okropne potwory, któych sila zwieksza ")
			say("sie wraz z odlegloscia od swiatyni w miescie.")
			wait()
			say_title("Kapitan:")
			say("Kamienie niestety caly czas spadaja i przez to ")
			say("jest nam bardzo ciezko pokonac plagi które na nas spadly ")
			say(", lub obronic przed potworami zajete juz ")
			say("przez nas tereny.")
			wait()
			say_title("Kapitan:")
			say("Dlatego potrzebujemy Twojej pomocy!")
			say("Pozyskalem takze kilku innych wojowników, aby ")
			say("Pomogli Ci w tym zadaniu. Musisz zdobyc dla mnie")
			say("Zloty Hak, który jest przechowywany przez")
			say("Silnych Pustynnych zawadiaków, oraz Zlota Przede ")
			say(", która mozesz zdobyc od Wezowych Mieczników.")
			say("Legenda glosi ze te przedmioty posiada")
			say(",tylko jednen ze 150 Potworów.")
			say("Powodzenia!")
			set_state(misja)
			pc.setqf("fab2", 1)
		end
	end

	state misja begin
		when letter begin
			send_letter("Niszczycielska Magia")
		end

		when button or info begin
			say_title("Niszczycielska Magia")
			say("Kapitan wysyla Cie na pustynie, abyS zdobyl ")
			say("dla niego Zloty Hak i Zlota Przede ")
			say(". Mozesz zdobyc te przedmioty zabijajac")
			say("odpowiednio Silnych Pustynnych zawadiaków,")
			say("Oraz Wezowych Mieczników. Powodzenia! ")
		end

		when 2158.kill with pc.getqf("fab2") == 1 and pc.count_item(30519) == 0 begin
			if pc.getqf("fab2m") == 49 then
				pc.setqf("fab2m", pc.getqf("fab2m")+1)
				syschat("Znalazles Zloty Hak! zanies go wraz z Zlota Przedza Kapitanowi!")
				pc.give_item2(30519, 1)
				pc.delqf("fab2m")
				if pc.count_item(30518) >= 1 then
					set_state(powrot)
				end
			else
				pc.setqf("fab2m", pc.getqf("fab2m")+1)
				syschat("Niestety ten zawadiaka nie posiadal przy sobie Haka.")
			end
		end

		when 2106.kill with pc.getqf("fab2") == 1 and pc.count_item(30518) == 0 begin
			if pc.getqf("fab2m1") == 68 then
				pc.setqf("fab2m1", pc.getqf("fab2m1")+1)
				syschat("Znalazles Zlota Przede ! zanies go wraz z Zlotym Hakiem Kapitanowi!")
				pc.give_item2(30518, 1)
				pc.delqf("fab2m1")
				if pc.count_item(30519) >= 1 then
					set_state(powrot)
				end
			else
				pc.setqf("fab2m1", pc.getqf("fab2m1")+1)
				syschat("Niestety ten waz nie posiadaL przy sobie Zlotej Przedzy.")
			end
		end
	end

	state powrot begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Niszczycielska Magia")
				end
			send_letter("Niszczycielska Magia")
		end

		when button or info begin
			say_title("Obrona pustyni")
			say("Gratulacje! Udalo Ci sie zdobyc Zlota ")
			say("Przedze oraz Zloty Hak! Udaj")
			say("sie teraz do Kapitana, aby otrzymac od")
			say("niego wynagrodzenie!")
		end

		when __TARGET__.target.click or 20355.chat."Niszczycielska Magia" with pc.count_item(30519) >= 1 and pc.count_item(30518) >= 1 and pc.getqf("fab2") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Ahh, udalo Ci sie!")
			say("Dziekuje!")
			say("Te przedmioty sa mi niezbedne do wytworzenia")
			say("euny, która pomoze nam w walce.")
			say("Juz sia za to biore! ")
			wait()
			say_title("Kapitan:")
			say("Jeszcze chwilke..")
			say(".")
			say(".")
			say(".")
			say(".")
			say(".")
			say(".")
			say(".")
			say(".")
			say(".")
			wait()
			say_title("Kapitan:")
			say("Te skladniki sa wreecz idealne do tej")
			say("Runy! Prosze, daj mi twe ramie.")
			say("Wypale tobie na ramieniu Znak")
			say("wielkiego wojownika. To bardzo")
			say("i potezny znak, ale ty na niego zasluzyles.")
			say("Dzieki niemu wojownik zadaje")
			say("wiecej obrazen potwora")
			say("nos go dumie, niech przypomina tobie")
			say("o twojej misji i o tym czemu chcesz ")
			say("walczyc...")
			say("...")
			say()
			say_reward("Otrzymano yang i exp")
			affect.add_collect(ATT_BONUS_TO_MONSTER,3,60*60*24*30*60)
			set_state(__complete)
			pc.delqf("fab2")
			pc.remove_item(30519, 1)
			pc.remove_item(30518, 1)
			pc.change_money(55000)
			pc.give_exp2(65500)
			clear_letter()
			set_quest_state("fabula3", "run")
		end
	end

	state __complete begin
	end
end