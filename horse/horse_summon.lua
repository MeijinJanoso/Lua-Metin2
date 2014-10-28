
-- # --------------------------------------------- #
-- #  Questfile from Metin2SF by Ethoard  #
-- # --------------------------------------------- #

quest horse_summon begin
	state start begin
		function get_horse_summon_prob_pct()
			local prob = {10,15,20,30,40,50,60,70,80,90,100}
			local skill_level = pc.get_skill_level(131) + 1
			return prob[skill_level]
		end
		when 20349.chat."Nowa Ksi�ga Zwyk�ego Konia " with horse.get_grade()==1 and pc.countitem("50051")<1 begin
			say_title("Stajenny:")
			say("Zgubi�e� Ksi�g� Zwyk�ego Konia! ")
			say("Mog� da� Ci now� za 100.000 Yang.")
			local b=select("Tak", "Nie")
			if 1==b then
				if pc.money>=10000 then
					pc.changemoney(-10000)
					say_title("Informacja:")
					say("Oto nowa Ksi�ga Zwyk�ego Konia! [ENTER]Tym razem spr�buj jej nie zgubi�! ")
					pc.give_item2("50051", 1)
				else
					say_title("Informacja:")
					say("Nie masz wystarczaj�co du�o yang!")
				end
			else
				return
			end
		end
		when 20349.chat."Nowa Ksi�ga Opancerz. Konia " with horse.get_grade()==2 and pc.countitem("50052")<1 begin
			say_title("Stajenny:")
			say("Zgubi�e� Ksi�g� Opancerz. Konia! ")
			say("Mog� da� Ci now� za 500.000 Yang.")
			local b=select("Tak", "Nie")
			if 1==b then
				if pc.money>=500000 then
					pc.changemoney(-500000)
					say_title("Informacja:")
					say("Oto nowa Ksi�ga Opancerz. Konia![ENTER]Tym razem spr�buj jej nie zgubi�! ")
					pc.give_item2("50052", 1)
				else
					say_title("Informacja:")
					say("Nie masz wystarczaj�co du�o yang!")
				end
			else
				return
			end
		end
		when 20349.chat."Nowa Ksi�ga Wojskowego Konia " with horse.get_grade()==3 and pc.countitem("50053")<1 begin
			say_title("Stajenny:")
			say("Zgubi�e� Ksi�g� Wojskowego Konia! ")
			say("Mog� da� Ci now� za 1.000.000 Yang.")
			local b=select("Tak", "Nie")
			if 1==b then
				if pc.money>=1000000 then
					pc.changemoney(-1000000)
					say_title("Informacja:")
					say("Oto nowa Ksi�ga Wojskowego Konia![ENTER]Tym razem spr�buj jej nie zgubi�! ")
					pc.give_item2("50053", 1)
				else
					say_title("Informacja:")
					say("Nie masz wystarczaj�co du�o yang!")
				end
			else
				return
			end
		end
		when 50051.use with horse.get_grade()==0 begin
			say_title("Informacja:")
			say_reward("Przywo�anie konia jest nie mo�liwe.[ENTER]Nie posiadasz go!")
		end
		when 50051.use with horse.get_grade()==1 begin
			if pc.getsp()>=100 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					notice("Ko� zosta� przywo�any. ")
					horse.summon()
				else
					say_title("Informacja:")
					say_reward("Przywo�anie Konia dla profesjonalist�w nie ")
					say_reward("powiod�o si�. ")
					say_reward("Mo�esz zwi�kszy� szans� na pomy�lne ")
					say_reward("przywo�anie poprzez trening swoich umiej�tno�ci.")
					say("")
				end
				pc.change_sp(-100)
			else
				say_title("Informacja:")
				say_reward("Masz za ma�o Punkt�w Energii. Aby przywo�a� ")
				say_reward("Konia, potrzebujesz ich co najmniej 300. ")
				say("")
			end
		end
		when 50051.use with horse.get_grade()==2 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50051.use with horse.get_grade()==3 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50052.use with horse.get_grade()==0 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50052.use with horse.get_grade()==1 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50052.use with horse.get_grade()==2 begin
			if pc.getsp()>=200 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					say_title("Informacja:")
					say_reward("Ko� zosta� przywo�any.")
					say("")
					horse.summon()
				else
					say_title("Informacja:")
					say_reward("Przywo�anie Konia powiod�o si�. ")
					say_reward("Mo�esz zwi�kszy� szans� na pomy�lne ")
					say_reward("przywo�anie poprzez trening swoich umiej�tno�ci.")
					say("")
				end
				pc.change_sp(-200)
			else
				say_title("Informacja:")
				say_reward("Masz za ma�o Punkt�w Energii. Aby przywo�a� ")
				say_reward("Konia, potrzebujesz ich co najmniej 300. ")
				say("")
			end
		end
		when 50052.use with horse.get_grade()==3 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50053.use with horse.get_grade()==0 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50053.use with horse.get_grade()==1 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50053.use with horse.get_grade()==2 begin
			say_title("Informacja:")
			say_reward("Ta ksi�ga nie jest odpowiednia!")
		end
		when 50053.use with horse.get_grade()==3 begin
			if pc.getsp()>=300 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					say_title("Informacja:")
					say_reward("Ko� zosta� przywo�any.")
					say("")
					horse.summon()
				else
					say_title("Informacja:")
					say_reward("Przywo�anie Konia nie powiod�o si�. ")
					say_reward("Mo�esz zwi�kszy� szans� na pomy�lne ")
					say_reward("przywo�anie poprzez trening swoich umiej�tno�ci. ")
					say("")
				end
				pc.change_sp(-300)
			else
				say_title("Informacja:")
				say_reward("Masz za ma�o Punkt�w Energii. Aby przywo�a� ")
				say_reward("Konia, potrzebujesz ich co najmniej 300. ")
				say("")
			end
		end
	end
end
