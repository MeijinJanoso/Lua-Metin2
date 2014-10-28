quest fabula4 begin
	state start begin
	end

	state run begin
		when login or levelup with pc.level >= 75 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Zbiórka Ekwipunku")
				end
			send_letter("Zbiórka Ekwipunku")
		end

		when button or info begin
			say_title("Zbiórka Ekwipunku")
			say("Kapitan prosi abyœ wykona³ dla niego ")
			say("kolejne zadanie. IdŸ do niego jak ")
			say("najprêdzej i dowiedz siê o co chodzi! ")
			say("Powodzenia!")
		end

		when __TARGET__.target.click or 20355.chat."Zbiórka Ekwipunku" begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Witaj ponownie!")
			say("Wspaniale ¿e siê zjawi³eœ! Od ostatniego")
			say("czasu nie mamy ¿adnych problemów ze stworami")
			say("z innych krain, lecz nie wiemy kiedy ")
			say("zdecyduj¹ siê nas zaatakowaæ, a niestety ")
			say("nasza obrona jest okropnie os³abiona..")
			wait()
			say_title("Kapitan:")
			say("Niestety nie jest ³atwo zdobyæ odpowiednie")
			say("uzbrojenie. Wytwarzamy je bowiem z Lodowych")
			say("Kryszta³ów, które mo¿na zdobyæ z Podziemnych")
			say("Kawa³ów Lodu, oraz z Lodowych Rogów, które ")
			say("mo¿na zdobyæ z Podziemnych Lodowych Lwów.")
			say("Oba te stwory mo¿na znaleŸæ na pierwszym ")
			say("poziomie Groty Wygnañców.")
			wait()
			say_title("Kapitan:")
			say("Nie jest ³atwo zdobyæ te przedmioty, ale")
			say("Ka¿dy z nich starcza na wytworzenie a¿ ")
			say("dziesiêciu zbroi. Potrzebujê wiêc po ")
			say("piêæ sztuk tych przedmiotów. Mam nadziejê ")
			say("¿e Ci siê to uda! ")
			say("Powodzenia!")
			set_state(misja)
			pc.setqf("fab4", 1)
		end
	end

	state misja begin
		when letter begin
			send_letter("Zbiórka Ekwipunku")
		end

		when button or info begin
			say_title("Zbiórka Ekwipunku")
			say("Na pierwszym poziomie Groty Wygnañców,")
			say("mo¿esz spotkaæ Podziemne Kawa³y Lodu i")
			say("Podziemne Lodowe Lwy. Zabijaj je, i")
			say("zdob¹dŸ dla kapitana po piêæ sztuk")
			say("Rubinowy Ozdobny Nóz i Lodowych Rogów.")
			say("Po uzbieraniu przedmiotów zanieœ je ")
			say("kapitanowi. Powodzenia!")
		end

		when 1131.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30500) == 0 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zbierz jeszcze cztery i zanieœ je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa³ lodu nie posiada³ przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 1 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zbierz jeszcze trzy i zanieœ je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa³ lodu nie posiada³ przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 2 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zbierz jeszcze dwa i zanieœ je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa³ lodu nie posiada³ przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 3 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zbierz jeszcze jeden i zanieœ je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa³ lodu nie posiada³ przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 4 then
				if pc.getqf("fab4m1") == 49 then
					if pc.count_item(30500) == 5 then
						pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
						syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zanieœ teraz rogi i kryszta³y kapitanowi!")
						set_state(misja2)
						pc.give_item2(30500, 1)
						pc.delqf("fab4m1")
					else
						pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
						syschat("Znalaz³eœ Rubinowy Ozdobny Nóz! Zbierz jeszcze Lodowe Rogi i zanieœ je kapitanowi!")
						pc.give_item2(30500, 1)
						pc.delqf("fab4m1")
					end
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa³ lodu nie posiada³ przy sobie Noza.")
				end
			end
		end

		when 1134.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30501) == 0 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz³eœ Zlota Sprzaczke! Zbierz jeszcze cztery i zanieœ je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada³ przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 1 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz³eœ Zlota Sprzaczke! Zbierz jeszcze trzy i zanieœ je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada³ przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 2 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz³eœ Zlota Sprzaczke! Zbierz jeszcze dwa i zanieœ je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada³ przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 3 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz³eœ Zlota Sprzaczke! Zbierz jeszcze jeden i zanieœ je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada³ przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 4 then
				if pc.getqf("fab4m2") == 49 then
					if pc.count_item(30500) == 5 then
						pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
						syschat("Znalaz³eœ Zlota Sprzaczke! Zanieœ teraz rogi i kryszta³y kapitanowi!")
						set_state(misja2)
						pc.give_item2(30501, 1)
						pc.delqf("fab4m2")
					else
						pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
						syschat("Znalaz³eœ Zlota Sprzaczke! Zbierz jeszcze Lodowe Rogi i zanieœ je kapitanowi!")
						pc.give_item2(30501, 1)
						pc.delqf("fab4m2")
					end
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada³ przy sobie Zlotej Sprzaczki.")
				end
			end
		end
	end

	state misja2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Zbiórka Ekwipunku")
				end
			send_letter("Zbiórka Ekwipunku")
		end

		when button or info begin
			say_title("Zbiórka Ekwipunku")
			say("Gratulacje! Uda³o Ci siê zdobyæ ")
			say("wszystkie piêæ kryszta³ów i rogów! Zanieœ ")
			say("je teraz do kapitana!")
		end

		when __TARGET__.target.click or 20355.chat."Zbiórka Ekwipunku" with pc.count_item(30500) == 5 and pc.count_item(30501) == 5 and pc.getqf("fab4") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Wspaniale! Uda³o Ci siê!")
			say("Wiem ju¿ nawet jak Ci siê wynagrodzê ")
			say("za Twój trud, ale potrzebujê jeszcze ")
			say("czegoœ..")
			wait()
			say_title("Kapitan:")
			say("Poza zbrojami, przyda³yby nam siê tak¿e")
			say("lepsze miecze. W tym celu mo¿emy przetopiæ ")
			say("kilka Rubinowych Ozdób na specjalne przedmioty,")
			say("które ulepszy³yby nasze miecze. Mo¿na je ")
			say("zdobyæ zabijaj¹c ¯o³nierzy Setaou, których")
			say("znajdziesz w Grocie Wygnañców. Proszê, ")
			say("uzbieraj ich dla mnie osiem sztuk. Mam ")
			say("nadziejê ¿e Ci siê uda! Powodzenia!")
			set_state(misja3)
			pc.remove_item(30500, 5)
			pc.remove_item(30501, 5)
		end
	end

	state misja3 begin
		when letter begin
			send_letter("Zbiórka Ekwipunku")
		end

		when button or info begin
			say_title("Zbiórka Ekwipunku")
			say("Niestety, jak siê okaza³o brakuje jeszcze")
			say("oœmiu Rubinowych Ozdób. Kapitan mówi, ¿e ")
			say("mo¿na je zdobyæ zabijaj¹c ¿o³nierzy ")
			say("setaou, którzy znajduj¹ siê w grocie ")
			say("wygnañców.")
			say("Powodzenia!")
		end

		when 2411.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30502) == 0 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze siedem i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 1 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze szeœæ i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 2 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze piêæ i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 3 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze cztery i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 4 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze trzy i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 5 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze dwa i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 6 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zbierz jeszcze jeden i zanieœ je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			elseif pc.count_item(30502) == 7 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz³eœ Rubinowa Ozdobe! Zanieœ je teraz kapitanowi!")
					set_state(powrot)
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u¿yæ.")
				end
			end
		end
	end

	state powrot begin
		when letter begin
			send_letter("Zbiórka Ekwipunku")
		end

		when button or info begin
			say_title("Zbiórka Ekwipunku")
			say("Gratulacje! Uda³o Ci siê znaleŸæ ")
			say("wszystkie miecze! IdŸ teraz do kapitana")
			say("i odbierz od niego nagrodê!")
		end

		when __TARGET__.target.click or 20355.chat."Zbiórka Ekwipunku" with pc.count_item(30502) == 8 and pc.getqf("fab4") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Ahh, nareszcie!")
			say("Ju¿ biorê siê za przetapianie!")
			say("Poczekaj proszê chwilkê..")
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
			say("Na szczêœcie wszystko jest dobrze.")
			say("Dzieki Tobie jesteœmy teraz o wiele")
			say("silniejsi!")
			say("Proszê, oto Twoja nagroda!")
			say()
			say_reward("Otrzymano yang i exp")
			pc.remove_item(30502, 8)
			pc.give_item2(71094, 80)
			pc.give_item2(71001, 80)
			pc.change_money(13456785)
			pc.give_exp2(296778988)
			pc.delqf("fab4")
			set_state(__complete)
			clear_letter()
			set_quest_state("fabula5", "run")
		end
	end

	state __complete begin
	end
end