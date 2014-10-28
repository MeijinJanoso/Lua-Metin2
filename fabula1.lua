quest fabula1 begin
	state start begin
		when login or levelup with pc.level >= 1 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20355)
			if v != 0 then
				target.vid("__TARGET__", v, "Test Na Wojownika")
			end
			send_letter("Test Na Wojownika")
		end

		when button or info begin
			say_title("Test Na Wojownika")
			say()
			say("Kapitan szuka nowych ludzi do ")
			say("armii kr�lestwa. Id� i zaoferuj ")
			say("mu swoj� pomoc! ")
			say()
			say_reward("Kapitana znajdziesz w Mie�cie! ")
		end

		when __TARGET__.target.click or 20355.chat."Test Na Wojownika" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Ahh, witaj! ")
			say("Kaza�em pos�a� po Ciebie list, ale by�em")
			say("pewien �e si� nie zjawisz. Tak czy siak, ")
			say("dzi�kuj� za przybycie. Czas na tw�j test.")
			wait()
			say_title("Kapitan:")
			say("Nasze miasto jest oblegane przez psy. ")
			say("Przez d�ugi czas staramy si� temu zaradzi�,")
			say("ale nie jest to proste. Jest ich naprawd� ")
			say("wiele. Pozyska�em tak�e kilkuset innych ")
			say("m�odych wojownik�w do naszej armii, wi�c")
			say("wystarczy jak wybierzesz si� poza mury ")
			say("naszego miesata i zabijesz 25 Dzikich ")
			say("Ps�w.")
			say("Powodzenia!")
			set_state(misja)
			pc.setqf("fab1", 1)
		end
	end

	state misja begin
		when letter begin
			send_letter("Test Na Wojownika")
		end

		when button or info begin
			say_title("Test Na Wojownika")
			say("Kapitan prosi Ci�, aby� zabi� ")
			say("25 Dzikich Ps�w. Znajdziesz je ")
			say("poza murami miasta. Powodzenia! ")
		end

		when 101.kill with pc.getqf("fab1") == 1 begin
			if pc.getqf("fab1m") == 24 then
				pc.setqf("fab1m", pc.getqf("fab1m")+1)
				syschat("Zabi�e� ju� "..pc.getqf("fab1m").." z 25 Dzikich Ps�w.")
				set_state(powrot)
				pc.delqf("fab1m")
			else
				pc.setqf("fab1m", pc.getqf("fab1m")+1)
				syschat("Zabi�e� ju� "..pc.getqf("fab1m").." z 25 Dzikich Ps�w.")
			end
		end
	end

	state powrot begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Test Na Wojownika")
				end
			send_letter("Test Na Wojownika")
		end

		when button or info begin
			say_title("Test Na Wojownika")
			say("Gratulacje! ")
			say("Uda�o Ci si� zabi� 25 Dzikich Ps�w! ")
			say("Udaj si� teraz do Kapitana aby odebra� ")
			say("nagrod�!")
		end

		when __TARGET__.target.click or 20355.chat."Test Na Wojownika" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Dzi�kuj� za pomoc! Zdales test! ")
			say("Jestes godzien nosic imie wielkiego wojownika ")
			say("Dzi�ki Tobie uda nam si� powstrzyma� t� ")
			say("okropn� plag�. Wzamian za to co� Ci dam. ")
			say("znalaz�em to zabijaj�c silne potwory. Mam ")
			say("nadziej� �e Ci si� to przyda. ")
			say()
			set_state(__complete)
			pc.change_money(1000)
			pc.give_exp2(6500)
			set_quest_state("fabula2", "run")
		end
	end

	state __complete begin
	end
end