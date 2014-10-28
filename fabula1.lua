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
			say("armii królestwa. IdŸ i zaoferuj ")
			say("mu swoj¹ pomoc! ")
			say()
			say_reward("Kapitana znajdziesz w Mieœcie! ")
		end

		when __TARGET__.target.click or 20355.chat."Test Na Wojownika" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Ahh, witaj! ")
			say("Kaza³em pos³aæ po Ciebie list, ale by³em")
			say("pewien ¿e siê nie zjawisz. Tak czy siak, ")
			say("dziêkujê za przybycie. Czas na twój test.")
			wait()
			say_title("Kapitan:")
			say("Nasze miasto jest oblegane przez psy. ")
			say("Przez d³ugi czas staramy siê temu zaradziæ,")
			say("ale nie jest to proste. Jest ich naprawdê ")
			say("wiele. Pozyska³em tak¿e kilkuset innych ")
			say("m³odych wojowników do naszej armii, wiêc")
			say("wystarczy jak wybierzesz siê poza mury ")
			say("naszego miesata i zabijesz 25 Dzikich ")
			say("Psów.")
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
			say("Kapitan prosi Ciê, abyœ zabi³ ")
			say("25 Dzikich Psów. Znajdziesz je ")
			say("poza murami miasta. Powodzenia! ")
		end

		when 101.kill with pc.getqf("fab1") == 1 begin
			if pc.getqf("fab1m") == 24 then
				pc.setqf("fab1m", pc.getqf("fab1m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("fab1m").." z 25 Dzikich Psów.")
				set_state(powrot)
				pc.delqf("fab1m")
			else
				pc.setqf("fab1m", pc.getqf("fab1m")+1)
				syschat("Zabi³eœ ju¿ "..pc.getqf("fab1m").." z 25 Dzikich Psów.")
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
			say("Uda³o Ci siê zabiæ 25 Dzikich Psów! ")
			say("Udaj siê teraz do Kapitana aby odebraæ ")
			say("nagrodê!")
		end

		when __TARGET__.target.click or 20355.chat."Test Na Wojownika" begin
			target.delete("__TARGET__")
			say_title("Kapitan: ")
			say("Dziêkujê za pomoc! Zdales test! ")
			say("Jestes godzien nosic imie wielkiego wojownika ")
			say("Dziêki Tobie uda nam siê powstrzymaæ tê ")
			say("okropn¹ plagê. Wzamian za to coœ Ci dam. ")
			say("znalaz³em to zabijaj¹c silne potwory. Mam ")
			say("nadziejê ¿e Ci siê to przyda. ")
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