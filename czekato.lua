quest SystemPunktow begin
	state start begin
		function aktualizuj()
			--local wszystkie_punkty = tonumber(query("SELECT wszystkie_punkty FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_metki_pkt = tonumber(query("SELECT ilosc_pkt_kamienie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_potwory_pkt = tonumber(query("SELECT ilosc_pkt_potwory FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_latwe_pkt = tonumber(query("SELECT ilosc_pkt_bossy_latwe FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_srednie_pkt = tonumber(query("SELECT ilosc_pkt_bossy_srednie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_trudne_pkt = tonumber(query("SELECT ilosc_pkt_bossy_trudne FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zabici_gracze_pkt = tonumber(query("SELECT ilosc_pkt_gracze FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			chat(zab_metki_pkt+zab_potwory_pkt+zab_bossy_latwe_pkt+zab_bossy_srednie_pkt+zab_bossy_trudne_pkt+zabici_gracze_pkt)
			query("UPDATE player.pkt_pvp SET wszystkie_punkty = '"..zab_metki_pkt+zab_potwory_pkt+zab_bossy_latwe_pkt+zab_bossy_srednie_pkt+zab_bossy_trudne_pkt+zabici_gracze_pkt.."' WHERE nick = '"..pc.get_name().."';")
		end
		when login with pc.getqf("dodaj_item") == 0 begin
			pc.give_item2("30198", 1)
			pc.setqf("dodaj_item", 666)
			local fisrt = query("INSERT INTO player.pkt_pvp SET nick = '"..pc.get_name().."';")
		end
		when 30198.use begin
			say_size(300, 400)
			--[[local zab_metki = tonumber((pc.getqf("pkt_zab_metkiKATj")*0.06)+(pc.getqf("pkt_zab_metkiKATdw")*0.02))
			local zab_potwory = tonumber((pc.getqf("pkt_zab_potworyKATj")*0.03)+(pc.getqf("pkt_zab_potworyKATtyp")*0.01))
			local zab_bossy_latwe = tonumber((pc.getqf("pkt_zab_bossy_latweKATj")/4)+(pc.getqf("pkt_zab_bossy_latweKATdw")*0.15)+(pc.getqf("pkt_zab_bossy_latweKATtr")*0.05)+(pc.getqf("pkt_zab_bossy_latweKATcz")*0.01))
			local zab_bossy_srednie = tonumber((pc.getqf("pkt_zab_bossy_srednieKATj")*0.38)+(pc.getqf("pkt_zab_bossy_srednieKATdw")*0.25)+(pc.getqf("pkt_zab_bossy_srednieKATtr")*0.12)+(pc.getqf("pkt_zab_bossy_srednieKATcz")*0.04))
			local zab_bossy_trudne = tonumber((pc.getqf("pkt_zab_bossy_trudneKATj")*0.54)+(pc.getqf("pkt_zab_bossy_trudneKATdw")*0.43)+(pc.getqf("pkt_zab_bossy_trudneKATtr")*0.35)+(pc.getqf("pkt_zab_bossy_trudneKATcz")*0.15))]]
			local wszystkie_punkty = tonumber(query("SELECT wszystkie_punkty FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_metki = tonumber(query("SELECT zab_kamienie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_metki_pkt = tonumber(query("SELECT ilosc_pkt_kamienie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_potwory = tonumber(query("SELECT zab_potwory FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_potwory_pkt = tonumber(query("SELECT ilosc_pkt_potwory FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_latwe = tonumber(query("SELECT zab_bossy_latwe FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_latwe_pkt = tonumber(query("SELECT ilosc_pkt_bossy_latwe FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_srednie = tonumber(query("SELECT zab_bossy_srednie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_srednie_pkt = tonumber(query("SELECT ilosc_pkt_bossy_srednie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_trudne = tonumber(query("SELECT zab_bossy_trudne FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zab_bossy_trudne_pkt = tonumber(query("SELECT ilosc_pkt_bossy_trudne FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zabici_gracze = tonumber(query("SELECT zab_gracze FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local zabici_gracze_pkt = tonumber(query("SELECT ilosc_pkt_gracze FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			say_trawa("Sedzia:[ENTER]")
			say_brzoskwinia("Tu mozesz zobaczyc swoje otrzymane Punkty, oraz")
			say_brzoskwinia("Ilosc zabitych potworów, kamieni metin itd.")
			say()
			say_zloto("Kamienie Metin: "..tonumber(zab_metki).." Punkty: "..zab_metki_pkt)
			say_zloto("Potwory: "..tonumber(zab_potwory).." Punkty: "..zab_potwory_pkt)
			say_zloto("Bossy Latwe: "..tonumber(zab_bossy_latwe).." Punkty: "..zab_bossy_latwe_pkt)
			say_zloto("Bossy Srednie: "..tonumber(zab_bossy_srednie).." Punkty: "..zab_bossy_srednie_pkt)
			say_zloto("Bossy Trudne: "..tonumber(zab_bossy_trudne).." Punkty: "..zab_bossy_trudne_pkt)
			say_zloto("Zabici Gracze: "..tonumber(zabici_gracze).." Punkty: "..zabici_gracze_pkt)
			say()
			say_malina("Ogólna Liczba Zarobionych Punktów: "..tonumber(wszystkie_punkty))
			say()
			if select("Ranking", "Wyjscie") == 1 then
				say_size(300, 400)
				say_trawa("Sedzia:[ENTER]")
				say_brzoskwinia("Dzieki tej opcji mozesz sprawdzic wyniki")
				say_brzoskwinia("najlepszych z najlepszych !")
				say()
				local rankNick = query_array("SELECT `nick` FROM player.pkt_pvp WHERE nick not like '[%' order by wszystkie_punkty;")
				local rankPkt = query_array("SELECT `wszystkie_punkty` FROM player.pkt_pvp WHERE nick not like '[%' order by wszystkie_punkty;")
				say_malina("Nick | Ilosc Punktów")
				say()
				pc.setqf("iloscASDFDSA", 0)
				for i = 300000, 1, -1 do
					if rankNick[i] != nil then
						pc.setqf("iloscASDFDSA", pc.getqf("iloscASDFDSA")+1)
						if pc.getqf("iloscASDFDSA") == 1 then
							say_zloto(rankNick[i].." | "..rankPkt[i])
						else
							say_cialo(rankNick[i].." | "..rankPkt[i])
						end
					end
					if pc.getqf("iloscASDFDSA") == 10 then
						break
					end
				end
				say()
				say()
			end
		end
		when kill with not npc.is_pc() begin
			pc.setqf("ilerazy"..npc.get_race(), pc.getqf("ilerazy"..npc.get_race())+1)
			-- Rozbite Kamienie Metin
			if npc.get_race() >= 8000 and npc.get_race() <= 8100 then
				local ilosc_zabbb_metki = tonumber(query("SELECT zab_kamienie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
				local dodac_zabbb_metki = 1
				query("UPDATE player.pkt_pvp SET zab_kamienie = '"..ilosc_zabbb_metki+dodac_zabbb_metki.."' WHERE nick = '"..pc.get_name().."';")
				pc.setqf("zab_metki", ilosc_zabbb_metki+dodac_zabbb_metki)
				local ilosc_pkttt_metki = query("SELECT ilosc_pkt_kamienie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
				if pc.getqf("zab_metki") <= 4000 then
					local dodac_pkttt_metki = 0.06
					query("UPDATE player.pkt_pvp SET ilosc_pkt_kamienie = '"..ilosc_pkttt_metki+dodac_pkttt_metki.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac_pkttt_metki = 0.02
					query("UPDATE player.pkt_pvp SET ilosc_pkt_kamienie = '"..ilosc_pkttt_metki+dodac_pkttt_metki.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
				return
			end
			-- Ogólna liczba zabitych potworów
			local ilosc_zabbb_potwory = tonumber(query("SELECT zab_potwory FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local dodac_zabbb_potwory = 1
			query("UPDATE player.pkt_pvp SET zab_potwory = '"..ilosc_zabbb_potwory+dodac_zabbb_potwory.."' WHERE nick = '"..pc.get_name().."';")
			-- Zabite bossy latwe
			if npc.get_race() == 191 then	-- Lykos
				local ilosc_zabbb_bossy_latwe = tonumber(query("SELECT zab_bossy_latwe FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
				local dodac_zabbb_bossy_latwe = 1
				query("UPDATE player.pkt_pvp SET zab_bossy_latwe = '"..ilosc_zabbb_bossy_latwe+dodac_zabbb_bossy_latwe.."' WHERE nick = '"..pc.get_name().."';")
				pc.setqf("zab_bossy_latwe", ilosc_zabbb_bossy_latwe+dodac_zabbb_bossy_latwe)
				local ilosc_pkttt_bossy_latwe = query("SELECT ilosc_pkt_bossy_latwe FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
				if pc.getqf("zab_bossy_latwe") <= 19 then
					local dodac_pkttt_bossy_latwe = 0.25
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_latwe") > 19 and pc.getqf("zab_bossy_latwe") <= 39 then
					local dodac_pkttt_bossy_latwe = 0.15
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_latwe = '"..ilosc_pkttt_bossy_latwe+dodac_pkttt_bossy_latwe.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_latwe") > 39 and pc.getqf("zab_bossy_latwe") <= 99 then
					local dodac_pkttt_bossy_latwe = 0.05
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_latwe = '"..ilosc_pkttt_bossy_latwe+dodac_pkttt_bossy_latwe.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_latwe") > 99 then
					local dodac_pkttt_bossy_latwe = 0.01
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_latwe = '"..ilosc_pkttt_bossy_latwe+dodac_pkttt_bossy_latwe.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			-- Zabite bossy Srednie
			elseif npc.get_race() == 1901 or 	-- 9 Ogonów
				npc.get_race() == 691 or 		-- Wódz Orków
				npc.get_race() == 1301 or 		-- Zjawa Zóltego Tygrysa
				npc.get_race() == 1091 or		-- Król Demonów
				npc.get_race() == 1092 then		-- Elitarny Król Demonów
				local ilosc_zabbb_bossy_srednie = tonumber(query("SELECT zab_bossy_srednie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
				local dodac_zabbb_bossy_srednie = 1
				query("UPDATE player.pkt_pvp SET zab_bossy_srednie = '"..ilosc_zabbb_bossy_srednie+dodac_zabbb_bossy_srednie.."' WHERE nick = '"..pc.get_name().."';")
				pc.setqf("zab_bossy_srednie", ilosc_zabbb_bossy_srednie+dodac_zabbb_bossy_srednie)
				local ilosc_pkttt_bossy_srednie = query("SELECT ilosc_pkt_bossy_srednie FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
				if pc.getqf("zab_bossy_srednie") <= 35 then
					local dodac_pkttt_bossy_srednie = 0.38
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_srednie = '"..ilosc_pkttt_bossy_srednie+dodac_pkttt_bossy_srednie.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_srednie") > 35 and pc.getqf("zab_bossy_srednie") <= 60 then
					local dodac_pkttt_bossy_srednie = 0.25
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_srednie = '"..ilosc_pkttt_bossy_srednie+dodac_pkttt_bossy_srednie.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_srednie") > 60 and pc.getqf("zab_bossy_srednie") <= 100 then
					local dodac_pkttt_bossy_srednie = 0.12
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_srednie = '"..ilosc_pkttt_bossy_srednie+dodac_pkttt_bossy_srednie.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac_pkttt_bossy_srednie = 0.04
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_srednie = '"..ilosc_pkttt_bossy_srednie+dodac_pkttt_bossy_srednie.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			-- Zabite bossy Trudne
			elseif npc.get_race() == 1093 or 	-- Umarly Rozpruwacz
				npc.get_race() == 1095 or 		--Niebieska Smierc
				npc.get_race() == 2191 or 		-- Zólw
				npc.get_race() == 2493 or  		-- Beran Setaou
				npc.get_race() == 1191 or  		-- Lodowa Wiedzma
				npc.get_race() == 2491 or  		-- Dowódca Yonghan
				npc.get_race() == 2492 or  		-- General Yonghan
				npc.get_race() == 2494 or  		-- Dowódca Huashin
				npc.get_race() == 2495 or 		-- General Huashin
				npc.get_race() == 2596 or 		-- Charon
				npc.get_race() == 2597 or		-- Azrael
				npc.get_race() == xxx or  		-- Wolny Slot 1
				npc.get_race() == xxx or 		-- Wolny Slot 2
				npc.get_race() == xxx then 		-- Wolny Slot 3
				local ilosc_zabbb_bossy_trudne = tonumber(query("SELECT zab_bossy_trudne FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
				local dodac_zabbb_bossy_trudne = 1
				query("UPDATE player.pkt_pvp SET zab_bossy_trudne = '"..ilosc_zabbb_bossy_trudne+dodac_zabbb_bossy_trudne.."' WHERE nick = '"..pc.get_name().."';")
				pc.setqf("zab_bossy_trudne", ilosc_zabbb_bossy_trudne+dodac_zabbb_bossy_trudne)
				local ilosc_pkttt_bossy_trudne = query("SELECT ilosc_pkt_bossy_trudne FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
				if pc.getqf("zab_bossy_trudne") <= 50 then
					local dodac_pkttt_bossy_trudne = 0.54
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_trudne = '"..ilosc_pkttt_bossy_trudne+dodac_pkttt_bossy_trudne.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_trudne") > 50 and pc.getqf("zab_bossy_trudne") <= 100 then
					local dodac_pkttt_bossy_trudne = 0.43
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_trudne = '"..ilosc_pkttt_bossy_trudne+dodac_pkttt_bossy_trudne.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				elseif pc.getqf("zab_bossy_trudne") > 100 and pc.getqf("zab_bossy_trudne") <= 250 then
					local dodac_pkttt_bossy_trudne = 0.35
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_trudne = '"..ilosc_pkttt_bossy_trudne+dodac_pkttt_bossy_trudne.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac_pkttt_bossy_trudne = 0.15
					query("UPDATE player.pkt_pvp SET ilosc_pkt_bossy_trudne = '"..ilosc_pkttt_bossy_trudne+dodac_pkttt_bossy_trudne.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			-- Potwory
			else
				local ilosc_pkttt_potwory = query("SELECT ilosc_pkt_potwory FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
				if pc.getqf("ilerazy"..npc.get_race()) <= 1000 then
					local dodac_pkttt_potwory = 0.03
					query("UPDATE player.pkt_pvp SET ilosc_pkt_potwory = '"..ilosc_pkttt_potwory+dodac_pkttt_potwory.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac_pkttt_potwory = 0.01
					query("UPDATE player.pkt_pvp SET ilosc_pkt_potwory = '"..ilosc_pkttt_potwory+dodac_pkttt_potwory.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			end
		end
		when kill with npc.is_pc() begin
			local ilosc = query("SELECT ilosc_pkt_gracze FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'")
			local zab_gracze = tonumber(query("SELECT zab_gracze FROM player.pkt_pvp WHERE nick = '"..pc.get_name().."'"))
			local dodac_zab_gracze = 1
			query("UPDATE player.pkt_pvp SET zab_gracze = '"..zab_gracze+dodac_zab_gracze.."' WHERE nick = '"..pc.get_name().."';")
			local moj_poziom = pc.get_level()
			local poziom_zabitego = npc.get_level()
			-- Róznica poziomów 8 wyzej i nizej
			if moj_poziom-poziom_zabitego <= 8 and moj_poziom-poziom_zabitego >= -8 then
				local dodac = 1
				query("UPDATE player.pkt_pvp SET ilosc_pkt_gracze = '"..ilosc+dodac.."' WHERE nick = '"..pc.get_name().."';")
				SystemPunktow.aktualizuj()
			elseif moj_poziom-poziom_zabitego >= 9 and moj_poziom-poziom_zabitego <= 25 or moj_poziom-poziom_zabitego <= -9 and moj_poziom-poziom_zabitego >= -25 then
				if moj_poziom > poziom_zabitego then
					local dodac = 100/90
					query("UPDATE player.pkt_pvp SET ilosc_pkt_gracze = '"..ilosc+dodac.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac = moj_poziom/poziom_zabitego
					query("UPDATE player.pkt_pvp SET ilosc_pkt_gracze = '"..ilosc+dodac.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			else
				if moj_poziom > poziom_zabitego then
					local dodac = 0.75*(poziom_zabitego/moj_poziom)
					query("UPDATE player.pkt_pvp SET ilosc_pkt_gracze = '"..ilosc+dodac.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				else
					local dodac = 1.25*(moj_poziom/poziom_zabitego)
					query("UPDATE player.pkt_pvp SET ilosc_pkt_gracze = '"..ilosc+dodac.."' WHERE nick = '"..pc.get_name().."';")
					SystemPunktow.aktualizuj()
				end
			end
		end
	end
end 