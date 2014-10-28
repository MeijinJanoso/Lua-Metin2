quest bug_xyli begin
	state start begin
		when 20016.chat."Zglos blad administracji" begin
			
			local status = query("SELECT status FROM log.support_status;")
			local player_status = query("SELECT status FROM log.support_bug WHERE account='"..pc.get_name().."';")
			
			if status == "0" then
				say_title(""..mob_name(20016)..":")
				say("System zgloszen jest wylaczony.")
				say("Przyjdz do mnie pózniej.")
				say("")
				say_title("Pozdrawiamy, administracja serwera.")
				return
			end
			
			if player_status == "0" then
				say_title(""..mob_name(20016)..":")
				say("Twoje poprzednie zgloszenie nie zostalo")
				say("jeszcze przeczytanie.")
				say("Wróc do mnie za jakis czas.")
				say("")
				say_title("Pozdrawiamy, administracja serwera.")
				return
			end
			
			if player_status == "1" then
				say_title("Administracja:")
				say("Przeczytalismy Twoje zgloszenie!")
				say("Zgloszony przez Ciebie blad wystepowal ")
				say("rzeczywiscie i zostal juz naprawiony.")
				say("Dziekujemy za pomoc!")
				say("")
				say_reward("Informacja:")
				say_reward("Otrzymales 10.000 Yang.")
				say_reward("Otrzymales 100 punktów rangi.")
				pc.give_gold(100000)
				local ranga = math.floor(pc.get_alignment() + 100)
				pc.change_alignment(ranga)
				query("DELETE FROM log.support_bug WHERE account='"..pc.get_name().."';")
				return
			end
			
			if player_status == "2" then
				say_title("Administracja:")
				say("Przeczytalismy Twoje zgloszenie!")
				say("Nie jestesmy wstanie")
				say("stwierdzic jaki wystepuje blad.")
				say("Spróbuj jeszcze raz.")
				say("")
				say_title("Pozdrawiamy, administracja serwera.")
				query("DELETE FROM log.support_bug WHERE account='"..pc.get_name().."';")
				return
			end
			
			if player_status == "3" then
				if pc.get_sex() == 0 then
					say_title("Administracja:")
					say("Otrzymales blokade chatu na 12 godzin")
					say("za uzycie przeklenstw w zgloszeniu.")
					say("")
					say_title("Pozdrawiamy, administracja serwera.")
				else
					say_title("Administracja:")
					say("Otrzymalas blokade chatu na 12 godzin")
					say("za uzycie przeklenstw w zgloszeniu.")
					say("")
					say_title("Pozdrawiamy, administracja serwera.")					
				end
				query("DELETE FROM log.support_bug WHERE account='"..pc.get_name().."';")
				block_chat("..pc.get_name()..", 12*60)
				return
			end
				
				
			if pc.get_sex() == 0 then
				say_title(""..mob_name(20016)..":")
				say("Znalazles blad/bug podczas gry?")
				say("Bardzo dobrze trafiles! ")
				say("Mozesz sie skontaktowac z administracja ")
				say("przeze mnie i podac im ten problem.")
				say("Pamietaj, ze skarg/zazalen itp.")
				say("nie mozesz zglaszac i bedzie to karane.")
				say("")
				say("Znalazles jakis blad?")
			else
				say_title(""..mob_name(20016)..":")
				say("Znalazlas blad/bug podczas gry?")
				say("Bardzo dobrze trafilas! ")
				say("Mozesz sie skontaktowac z administracja ")
				say("przeze mnie i podac im ten problem.")
				say("Pamietaj, ze skarg/zazalen itp.")
				say("nie mozesz zglaszac i bedzie to karane.")
				say("")
				say("Znalazlas jakis blad?")
			end
			
			local a = select("Tak i chce go zglosic ", "Nie")
			
			if a == 1 then
				say_reward("Ostrzezenie!")
				say_reward("Pamietaj, ze mozesz zglosic tylko blad/bug.")
				say_reward("Zgloszenia nie na temat beda surowo karane.")
				say_reward("Wraz ze zgloszeniem bedzie")
				say_reward("wyslany Twój nick.")
				wait()
				say_title(""..mob_name(20016)..":")
				say("Jezeli zabraknie miejsca to kliknij OK.")
				say("Opisz znaleziony blad.")
				local support1 = input()
				
				say_title(""..mob_name(20016)..":")
				say("Dodac jeszcze jedno okno?")
				local b = select("Tak", "Nie")
				
				if b == 1 then
					say_title(""..mob_name(20016)..":")
					say("Jezeli zabraknie miejsca to kliknij OK.")
					say("Opisz znaleziony blad.")
					local support2 = input()
					
					say_title(""..mob_name(20016)..":")
					say("Dodac jeszcze jedno okno?")
					local c = select("Tak", "Nie")
					
					if c == 1 then
						say_title(""..mob_name(20016)..":")
						say("Jezeli zabraknie miejsca to kliknij OK.")
						say("Opisz znaleziony blad.")
						local support3 = input()
						
						say_title(""..mob_name(20016)..":")
						say("Dodac jeszcze jedno okno?")
						local d = select("Tak", "Nie")	
						
						if d == 1 then
							say_title(""..mob_name(20016)..":")
							say("Jezeli zabraknie miejsca to kliknij OK.")
							say("Opisz znaleziony blad.")	
							local support4 = input()
							
							say_title(""..mob_name(20016)..":")
							say("Chcesz wyslac ponizsze zgloszenie?")
							say_reward(""..support1.." "..support2.." "..support3.." "..support4.."")
							local s = select("Tak, chce ", "Nie, nie chce ")
							
							if s == 1 then
								say_title(""..mob_name(20016)..":")
								say("Zgloszenie zostalo wyslane do administracji.")
								say("Sprawdz za jakis czas, czy nie ma odpowiedzi.")
								query("INSERT INTO log.support_bug (account, level, empire, status, bug, date) VALUES ('"..pc.get_name().."', '"..pc.get_level().."', '"..pc.get_empire().."', '0', '"..support1.." "..support2.." "..support3.." "..support4.."', '"..os.date().."');")
							end
							
							if s == 2 then
								say_title(""..mob_name(20016)..":")
								say("Pozdrawiam w imieniu administracji.")
							end							
							
						end
						
						if d == 2 then
							say_title(""..mob_name(20016)..":")
							say("Chcesz wyslac ponizsze zgloszenie?")
							say_reward(""..support1.." "..support2.." "..support3.."")
							local s = select("Tak, chce ", "Nie, nie chce ")
							
							if s == 1 then
								say_title(""..mob_name(20016)..":")
								say("Zgloszenie zostalo wyslane do administracji.")
								say("Sprawdz za jakis czas, czy nie ma odpowiedzi.")
								query("INSERT INTO log.support_bug (account, level, empire, status, bug, date) VALUES ('"..pc.get_name().."', '"..pc.get_level().."', '"..pc.get_empire().."', '0', '"..support1.." "..support2.." "..support3.."', '"..os.date().."');")
							end
							
							if s == 2 then
								say_title(""..mob_name(20016)..":")
								say("Pozdrawiam w imieniu administracji.")
							end
						end
					end
					
					if c == 2 then
						say_title(""..mob_name(20016)..":")
						say("Chcesz wyslac ponizsze zgloszenie?")
						say_reward(""..support1.." "..support2.."")
						local s = select("Tak, chce ", "Nie, nie chce ")
						
						if s == 1 then
							say_title(""..mob_name(20016)..":")
							say("Zgloszenie zostalo wyslane do administracji.")
							say("Sprawdz za jakis czas, czy nie ma odpowiedzi.")
							query("INSERT INTO log.support_bug (account, level, empire, status, bug, date) VALUES ('"..pc.get_name().."', '"..pc.get_level().."', '"..pc.get_empire().."', '0', '"..support1.." "..support2.."', '"..os.date().."');")
						end
						
						if s == 2 then
							say_title(""..mob_name(20016)..":")
							say("Pozdrawiam w imieniu administracji.")
						end	
					end
				end
				
				if b == 2 then
					say_title(""..mob_name(20016)..":")
					say("Chcesz wyslac ponizsze zgloszenie?")
					say_reward(""..support1.."")
					local s = select("Tak, chce ", "Nie, nie chce ")
					
					if s == 1 then
						say_title(""..mob_name(20016)..":")
						say("Zgloszenie zostalo wyslane do administracji.")
						say("Sprawdz za jakis czas, czy nie ma odpowiedzi.")
						query("INSERT INTO log.support_bug (account, level, empire, status, bug, date) VALUES ('"..pc.get_name().."', '"..pc.get_level().."', '"..pc.get_empire().."', '0', '"..support1.."', '"..os.date().."');")
					end
					
					if s == 2 then
						say_title(""..mob_name(20016)..":")
						say("Pozdrawiam w imieniu administracji.")
					end
				end
		
			end
		end
	end
end