----------------------------------------
-- System Bankowosci
-- Autor: Teodor
----------------------------------------
quest bank begin
	state start begin
		function update()
			local operations = {"Brak", "Wplacenie_Pieniedzy", "Wyplacenie_Pieniedzy"}
			cmdchat("BankData "..pc.getqf("yang_in_bank").." Brak "..operations[pc.getqf("operation")+1])
		end
		when login begin
			cmdchat("BankQuest "..q.getcurrentquestindex())
			bank.update()
		end
		when button or info begin
			local yang = tonumber(get_input("GetInput"))
			local type = tonumber(get_input("GetInput"))

			if string.find(yang, "nan") or string.find(yang, "NaN") or string.find(yang, "naN") or string.find(yang, "NAn") or string.find(yang, "nAn") or string.find(yang, "Nan") or yang < 1 then -- prawilnie
				syschat("Nie mozesz uzyc tej wartosci!")
				return
			end
			if string.find(type, "nan") or string.find(type, "NaN") or string.find(type, "naN") or string.find(type, "NAn") or string.find(type, "nAn") or string.find(type, "Nan") or type < 1 then -- prawilnie
				syschat("Nie mozesz uzyc tej wartosci!")
				return
			end
			if type == 1 then
				if pc.get_gold() >= yang then
					if (pc.getqf("yang_in_bank")+yang) > 1999999999 then
						syschat("Posiadasz maksymalna kwote w banku!")
						return
					end
					pc.change_gold(-yang)
					pc.setqf("yang_in_bank", pc.getqf("yang_in_bank")+yang)
					pc.setqf("operation", 1)
				else
					syschat("Nie posiadasz takiej ilosci Yang!")
				end
			elseif type == 2 then
				if pc.getqf("yang_in_bank") < yang then
					syschat("Nie posiadasz takiej ilosci Yang!")
					return
				end
				if (pc.get_gold()+yang) >= 1999999999 then
					syschat("Nie mozesz przelac tak duzej kwoty!")
				else
					pc.setqf("yang_in_bank", pc.getqf("yang_in_bank")-yang)
					pc.change_gold(yang)
					pc.setqf("operation", 2)
				end
			end
			bank.update()
		end
	end
end