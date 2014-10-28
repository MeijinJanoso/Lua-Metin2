quest fabula3 begin
	state start begin
	end

	state run begin
		when login or levelup with pc.level >= 50 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "W poszukiwaniu")
				end
			send_letter("W poszukiwaniu")
		end

		when button or info begin
			say_title("W poszukiwaniu")
			say()
			say("Kapitan wzywa Ci� na kolejn� misj�.")
			say("Id� do niego jak najpr�dzej i dowiedz")
			say("si� o co chodzi.")
			say("Powodzenia!")
		end

		when __TARGET__.target.click or 20355.chat."Szukajac " begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Ah, witaj, witaj! ")
			say("Ca�e szcz�cie �e ci�gle si� szkolisz")
			say("i z �atwo�ci� przyjmujesz zdobyt� wiedz�!")
			say("Dzi�ki temu mam kolejn� osob� do obrony")
			say("naszego kr�lestwa.")
			say("Do rzeczy..")
			wait()
			say_title("Kapitan:")
			say("Kilka dni temu nasi szpiedzy")
			say("znalezli siekawa rzecz mianowicie")
			say("Lodowe stwory posiadaja bardzo potezny")
			say("material.")
			wait()
			say_title("Kapitan:")
			say("Wiem ze wydaje sie to tobie niemozliwe")
			say("ale taka jest prawda...")
			say("Musisz przyniesc dla nas pr�bki")
			say("Zabijaj Lodowe Golemy to one nosza material")
			say("Powodzenia!")
			set_state(misja)
			pc.setqf("fab3", 1)
		end
	end

	state misja begin
		when letter begin
			send_letter("W poszukiwaniu")
		end

		when button or info begin
			say_title("W poszukiwaniu")
			say("Musze znalesc to czego poszukuje armia")
			say("Kapitan m�wil ze to bardzo wazne")
			say("nie wiem jak to wyglada...")
			say("Znajde to sie dowiem")
			say("...")
			say("mam taka nadzieje")
			say()
			say_reward("Lodowe Golemy mo�esz znale�� na G�rze")
			say_reward("Sohan.")
		end

		when 1107.kill with pc.getqf("fab3") == 1 and pc.count_item(30512) == 0 begin
			if pc.getqf("fab3m") == 39 then
				pc.setqf("fab3m", pc.getqf("fab3m")+1)
				syschat("Czerwona smocza stal! Zbierz jeszcze cztery i zanie� je kapitanowi!")
				pc.give_item2(30512, 1)
				pc.delqf("fab3m")
				pc.setqf("fab3f1", 1)
			else
				pc.setqf("fab3m", pc.getqf("fab3m")+1)
				syschat("Niestety, ten golem nie posiada� przy sobie zadnego potrzebnego przedmiotu.")
			end
		end


		when 1107.kill with pc.getqf("fab3") == 1 and pc.getqf("fab3f1") == 1 and pc.count_item(30511) == 0 begin
			if pc.getqf("fab3m1") == 49 then
				pc.setqf("fab3m1", pc.getqf("fab3m1")+1)
				syschat("Czerwony Material! Zbierz jeszcze trzy i zanie� je kapitanowi!")
				pc.give_item2(30511, 1)
				pc.delqf("fab3m1")
				pc.setqf("fab3f2", 1)
			else
				pc.setqf("fab3m1", pc.getqf("fab3m1")+1)
				syschat("Niestety, ten golem nie posiada� przy sobie zadnego potrzebnego przedmiotu.")
			end
		end

		when 1107.kill with pc.getqf("fab3") == 1 and pc.getqf("fab3f2") == 1 and pc.count_item(30515) == 0 begin
			if pc.getqf("fab3m2") == 59 then
				pc.setqf("fab3m2", pc.getqf("fab3m2")+1)
				syschat("Purpurowa Smocza Stal! Zbierz jeszcze dwie i zanie� je kapitanowi!")
				pc.give_item2(30515, 1)
				pc.delqf("fab3m2")
				pc.setqf("fab3f3", 1)
			else
				pc.setqf("fab3m2", pc.getqf("fab3m2")+1)
				syschat("Niestety, ten golem nie posiada� przy sobie zadnego potrzebnego przedmiotu")
			end
		end

		when 1107.kill with pc.getqf("fab3") == 1 and pc.getqf("fab3f3") == 1 and pc.count_item(30514) == 0 begin
			if pc.getqf("fab3m3") == 69 then
				pc.setqf("fab3m3", pc.getqf("fab3m3")+1)
				syschat("Fioletowy Material! Zbierz jeszcze jedn� i zanie� je kapitanowi!")
				pc.give_item2(30514, 1)
				pc.delqf("fab3m3")
				pc.setqf("fab3f4", 1)
			else
				pc.setqf("fab3m3", pc.getqf("fab3m3")+1)
				syschat("Niestety, ten golem nie posiada� przy sobie zadnego potrzebnego przedmiotu.")
			end
		end
	
		when 1107.kill with pc.getqf("fab3") == 1 and pc.getqf("fab3f4") == 1 and pc.count_item(30509) == 0 begin
			if pc.getqf("fab3m4") == 79 then
				pc.setqf("fab3m4", pc.getqf("fab3m4")+1)
				syschat("Niebieska Smocza Stal! Zanie� teraz wszystkie flagi kapitanowi!")
				pc.give_item2(30509, 1)
				pc.delqf("fab3m4")
				pc.delqf("fab3f1")
				pc.delqf("fab3f2")
				pc.delqf("fab3f3")
				pc.delqf("fab3f4")
				set_state(misja2)
			else
				pc.setqf("fab3m4", pc.getqf("fab3m4")+1)
				syschat("Niestety, ten golem nie posiada� przy sobie �adnej z flag.")
			end
		end
	end

	state misja2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "W poszukiwaniu")
				end
			send_letter("W poszukiwaniu")
		end

		when button or info begin
			say_title("W poszukiwaniu")
			say("Gratulacje! Uda�o Ci si� zdoby� ")
			say("wszystkie materialy! Zanie� je teraz")
			say("do kapitana!")
		end

		when __TARGET__.target.click or 20355.chat."W poszukiwaniu" with pc.count_item(30512) >= 1 and pc.count_item(30511) >= 1 and pc.count_item(30515) >= 1 and pc.count_item(30514) >= 1 and pc.count_item(30509) >= 1 and pc.getqf("fab3") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Och, wspaniale!")
			say("Nareszcie uda�o Ci si� zdobyc wszystkie materialy!")
			say("oczywi�cie sowicie Ci� za to wynagrodz�, lecz")
			say("musisz chwilk� poczeka�. P�jd� tylko przekaze ")
			say("material do badan")
			wait()
			say_title("Kapitan:")
			say(".")
			say(".")
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
			say(".")
			say(".")
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
			say("Na Boga!")
			say("Od stra�nika dowiedzia�em si� �e znik�y")
			say("mityczne przedmioty z naszego miasta!")
			say("Mo�esz je znale�� przy Metinach �mierci")
			say("na G�rze Sohan. Prosz�, zdob�d� je ")
			say("najszybciej jak to tylko mo�liwe. ")
			say("Powodzenia!")
			set_state(misja3)
			pc.remove_item(30512, 1)
			pc.remove_item(30511, 1)
			pc.remove_item(30515, 1)
			pc.remove_item(30514, 1)
			pc.remove_item(30509, 1)
		end
	end

	state misja3 begin
		when letter begin
			send_letter("W poszukiwaniu")
		end

		when button or info begin
			say_title("W poszukiwaniu")
			say("Niestety, jak si� okaza�o brakuje ")
			say("mitycznych przedniot�w. Kapitan m�wi �e znajduj� si� ")
			say("one w Metinach �mierci. Id� i zniszcz kilka")
			say("takich metin�w aby zdoby� owe przedmioty.")
			say("Powodzenia!")
			say()
			say_reward("Metiny �mierci mo�esz znale�� na G�rze")
			say_reward("Sohan.")
		end

		when 8013.kill with pc.getqf("fab3") == 1 and pc.count_item(30510) == 0 begin
			if pc.getqf("fab3m5") == 1 then
				pc.setqf("fab3m5", pc.getqf("fab3m5")+1)
				syschat("Wytworny Naramiennik! Znajd� jeszcze jedn� i zanie� je kapitanowi!")
				pc.give_item2(30510, 1)
				pc.delqf("fab3m5")
				pc.setqf("fab3mm1", 1)
			else
				pc.setqf("fab3m5", pc.getqf("fab3m5")+1)
				syschat("Niestety,w tym metinie nie bylo zadnego potrzebnego przedmiotu!")
			end
		end

		when 8013.kill with pc.getqf("fab3") == 1 and pc.getqf("fab3mm1") == 1 and pc.count_item(30516) == 0 begin
			if pc.getqf("fab3m6") == 2 then
				pc.setqf("fab3m6", pc.getqf("fab3m6")+1)
				syschat("Antyczny Naramiennik! Zanie� mistyczne przedmioty kapitanowi!")
				pc.give_item2(30516, 1)
				pc.delqf("fab3m6")
				pc.delqf("fab3mm1")
				set_state(powrot)
			else
				pc.setqf("fab3m6", pc.getqf("fab3m6")+1)
				syschat("Niestety,w tym metinie nie bylo zadnego potrzebnego przedmiotu!")
			end
		end
	end

	state powrot begin
		when letter begin
			send_letter("W poszukiwaniu")
		end

		when button or info begin
			say_title("W poszukiwaniu")
			say("Gratulacje! Uda�o Ci si� znale�� ")
			say("Mityczne przedmioty! Id� teraz do kapitana")
			say("i odbierz od niego nagrod�!")
		end

		when __TARGET__.target.click or 20355.chat."W poszukiwaniu" with pc.count_item(30510) >= 1 and pc.count_item(30516) >= 1 and pc.getqf("fab3") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Nareszcie! Tym razem jestem ju� pewien,")
			say(" �e s� to wszystko co mi od Ciebie trzeba!")
			say("Dzi�kuj� Ci za wszystko.")
			say("Jeszcze raz wielkie dzi�ki!")
			say()
			say_reward("otrzymano rady i egzo")
			say_reward("Otrzymano yang i exp")
			pc.delqf("fab3")
			set_state(__complete)
			pc.remove_item(30510, 1)
			pc.remove_item(30516, 1)
			pc.give_item2(71094, 15)
			pc.give_item2(71001, 15)
			pc.change_money(1200000)
			pc.give_exp2(7651111)
			clear_letter()
			
			set_quest_state("fabula4", "run")
		end
	end

	state __complete begin
	end
end