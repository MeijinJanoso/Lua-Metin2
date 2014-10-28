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
					target.vid("__TARGET__", v, "Zbi�rka Ekwipunku")
				end
			send_letter("Zbi�rka Ekwipunku")
		end

		when button or info begin
			say_title("Zbi�rka Ekwipunku")
			say("Kapitan prosi aby� wykona� dla niego ")
			say("kolejne zadanie. Id� do niego jak ")
			say("najpr�dzej i dowiedz si� o co chodzi! ")
			say("Powodzenia!")
		end

		when __TARGET__.target.click or 20355.chat."Zbi�rka Ekwipunku" begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Witaj ponownie!")
			say("Wspaniale �e si� zjawi�e�! Od ostatniego")
			say("czasu nie mamy �adnych problem�w ze stworami")
			say("z innych krain, lecz nie wiemy kiedy ")
			say("zdecyduj� si� nas zaatakowa�, a niestety ")
			say("nasza obrona jest okropnie os�abiona..")
			wait()
			say_title("Kapitan:")
			say("Niestety nie jest �atwo zdoby� odpowiednie")
			say("uzbrojenie. Wytwarzamy je bowiem z Lodowych")
			say("Kryszta��w, kt�re mo�na zdoby� z Podziemnych")
			say("Kawa��w Lodu, oraz z Lodowych Rog�w, kt�re ")
			say("mo�na zdoby� z Podziemnych Lodowych Lw�w.")
			say("Oba te stwory mo�na znale�� na pierwszym ")
			say("poziomie Groty Wygna�c�w.")
			wait()
			say_title("Kapitan:")
			say("Nie jest �atwo zdoby� te przedmioty, ale")
			say("Ka�dy z nich starcza na wytworzenie a� ")
			say("dziesi�ciu zbroi. Potrzebuj� wi�c po ")
			say("pi�� sztuk tych przedmiot�w. Mam nadziej� ")
			say("�e Ci si� to uda! ")
			say("Powodzenia!")
			set_state(misja)
			pc.setqf("fab4", 1)
		end
	end

	state misja begin
		when letter begin
			send_letter("Zbi�rka Ekwipunku")
		end

		when button or info begin
			say_title("Zbi�rka Ekwipunku")
			say("Na pierwszym poziomie Groty Wygna�c�w,")
			say("mo�esz spotka� Podziemne Kawa�y Lodu i")
			say("Podziemne Lodowe Lwy. Zabijaj je, i")
			say("zdob�d� dla kapitana po pi�� sztuk")
			say("Rubinowy Ozdobny N�z i Lodowych Rog�w.")
			say("Po uzbieraniu przedmiot�w zanie� je ")
			say("kapitanowi. Powodzenia!")
		end

		when 1131.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30500) == 0 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zbierz jeszcze cztery i zanie� je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa� lodu nie posiada� przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 1 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zbierz jeszcze trzy i zanie� je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa� lodu nie posiada� przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 2 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zbierz jeszcze dwa i zanie� je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa� lodu nie posiada� przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 3 then
				if pc.getqf("fab4m1") == 49 then
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zbierz jeszcze jeden i zanie� je kapitanowi!")
					pc.give_item2(30500, 1)
					pc.delqf("fab4m1")
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa� lodu nie posiada� przy sobie Noza.")
				end
			elseif pc.count_item(30500) == 4 then
				if pc.getqf("fab4m1") == 49 then
					if pc.count_item(30500) == 5 then
						pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
						syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zanie� teraz rogi i kryszta�y kapitanowi!")
						set_state(misja2)
						pc.give_item2(30500, 1)
						pc.delqf("fab4m1")
					else
						pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
						syschat("Znalaz�e� Rubinowy Ozdobny N�z! Zbierz jeszcze Lodowe Rogi i zanie� je kapitanowi!")
						pc.give_item2(30500, 1)
						pc.delqf("fab4m1")
					end
				else
					pc.setqf("fab4m1", pc.getqf("fab4m1")+1)
					syschat("Niestety, ten kawa� lodu nie posiada� przy sobie Noza.")
				end
			end
		end

		when 1134.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30501) == 0 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz�e� Zlota Sprzaczke! Zbierz jeszcze cztery i zanie� je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada� przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 1 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz�e� Zlota Sprzaczke! Zbierz jeszcze trzy i zanie� je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada� przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 2 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz�e� Zlota Sprzaczke! Zbierz jeszcze dwa i zanie� je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada� przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 3 then
				if pc.getqf("fab4m2") == 49 then
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Znalaz�e� Zlota Sprzaczke! Zbierz jeszcze jeden i zanie� je kapitanowi!")
					pc.give_item2(30501, 1)
					pc.delqf("fab4m2")
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada� przy sobie Zlotej Sprzaczki.")
				end
			elseif pc.count_item(30501) == 4 then
				if pc.getqf("fab4m2") == 49 then
					if pc.count_item(30500) == 5 then
						pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
						syschat("Znalaz�e� Zlota Sprzaczke! Zanie� teraz rogi i kryszta�y kapitanowi!")
						set_state(misja2)
						pc.give_item2(30501, 1)
						pc.delqf("fab4m2")
					else
						pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
						syschat("Znalaz�e� Zlota Sprzaczke! Zbierz jeszcze Lodowe Rogi i zanie� je kapitanowi!")
						pc.give_item2(30501, 1)
						pc.delqf("fab4m2")
					end
				else
					pc.setqf("fab4m2", pc.getqf("fab4m2")+1)
					syschat("Niestety, ten lodowy lew nie posiada� przy sobie Zlotej Sprzaczki.")
				end
			end
		end
	end

	state misja2 begin
		when letter begin
			local v = find_npc_by_vnum(20355)
				if v != 0 then
					target.vid("__TARGET__", v, "Zbi�rka Ekwipunku")
				end
			send_letter("Zbi�rka Ekwipunku")
		end

		when button or info begin
			say_title("Zbi�rka Ekwipunku")
			say("Gratulacje! Uda�o Ci si� zdoby� ")
			say("wszystkie pi�� kryszta��w i rog�w! Zanie� ")
			say("je teraz do kapitana!")
		end

		when __TARGET__.target.click or 20355.chat."Zbi�rka Ekwipunku" with pc.count_item(30500) == 5 and pc.count_item(30501) == 5 and pc.getqf("fab4") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Wspaniale! Uda�o Ci si�!")
			say("Wiem ju� nawet jak Ci si� wynagrodz� ")
			say("za Tw�j trud, ale potrzebuj� jeszcze ")
			say("czego�..")
			wait()
			say_title("Kapitan:")
			say("Poza zbrojami, przyda�yby nam si� tak�e")
			say("lepsze miecze. W tym celu mo�emy przetopi� ")
			say("kilka Rubinowych Ozd�b na specjalne przedmioty,")
			say("kt�re ulepszy�yby nasze miecze. Mo�na je ")
			say("zdoby� zabijaj�c �o�nierzy Setaou, kt�rych")
			say("znajdziesz w Grocie Wygna�c�w. Prosz�, ")
			say("uzbieraj ich dla mnie osiem sztuk. Mam ")
			say("nadziej� �e Ci si� uda! Powodzenia!")
			set_state(misja3)
			pc.remove_item(30500, 5)
			pc.remove_item(30501, 5)
		end
	end

	state misja3 begin
		when letter begin
			send_letter("Zbi�rka Ekwipunku")
		end

		when button or info begin
			say_title("Zbi�rka Ekwipunku")
			say("Niestety, jak si� okaza�o brakuje jeszcze")
			say("o�miu Rubinowych Ozd�b. Kapitan m�wi, �e ")
			say("mo�na je zdoby� zabijaj�c �o�nierzy ")
			say("setaou, kt�rzy znajduj� si� w grocie ")
			say("wygna�c�w.")
			say("Powodzenia!")
		end

		when 2411.kill with pc.getqf("fab4") == 1 begin
			if pc.count_item(30502) == 0 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze siedem i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 1 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze sze�� i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 2 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze pi�� i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 3 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze cztery i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 4 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze trzy i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 5 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze dwa i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 6 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zbierz jeszcze jeden i zanie� je kapitanowi!")
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			elseif pc.count_item(30502) == 7 then
				if pc.getqf("fab4m3") == 39 then
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Znalaz�e� Rubinowa Ozdobe! Zanie� je teraz kapitanowi!")
					set_state(powrot)
					pc.give_item2(30502, 1)
					pc.delqf("fab4m3")
				else
					pc.setqf("fab4m3", pc.getqf("fab4m3")+1)
					syschat("Niestety, ta Ozdoba jest zbyt zniszczona aby go u�y�.")
				end
			end
		end
	end

	state powrot begin
		when letter begin
			send_letter("Zbi�rka Ekwipunku")
		end

		when button or info begin
			say_title("Zbi�rka Ekwipunku")
			say("Gratulacje! Uda�o Ci si� znale�� ")
			say("wszystkie miecze! Id� teraz do kapitana")
			say("i odbierz od niego nagrod�!")
		end

		when __TARGET__.target.click or 20355.chat."Zbi�rka Ekwipunku" with pc.count_item(30502) == 8 and pc.getqf("fab4") == 1 begin
			target.delete("__TARGET__")
			say_title("Kapitan:")
			say("Ahh, nareszcie!")
			say("Ju� bior� si� za przetapianie!")
			say("Poczekaj prosz� chwilk�..")
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
			say("Na szcz�cie wszystko jest dobrze.")
			say("Dzieki Tobie jeste�my teraz o wiele")
			say("silniejsi!")
			say("Prosz�, oto Twoja nagroda!")
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