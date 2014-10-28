quest wskaznikHpWroga begin
	state start begin
		when login begin
			cmdchat("super_quest "..q.getcurrentquestindex())
		end

		when info or button begin
			cmdchat("get_input_start")
			local vid = input(cmdchat("get_input_value"))
			cmdchat("get_input_end")
			local old_pc = pc.select(vid)
			local name = pc.get_name()
			local hp = pc.get_hp()
			local max_hp = pc.get_max_hp()
			local mp = pc.get_sp()
			local max_mp = pc.get_max_sp()
			pc.select(old_pc)
			cmdchat("pvp_zdruwko "..name.."|"..hp.."|"..max_hp.."|"..mp.."|"..max_mp)
		end
	end
end