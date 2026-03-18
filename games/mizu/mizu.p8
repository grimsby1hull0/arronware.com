pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
 poke(0x5f2e,1)
 pal({[0]=0,2,-8,8,-2,-12,-7,9,-9,-4,12,-1,7,-5,-6,11},1)
	
	page=1
	
	-- part of map
	part=1
	
	page1music=false
	
	

	player ={
		spr=90,
		inv=false,
		facing=0,
		x=30,
		y=102,
		dx=0,
		dy=0,
		

		
	
	}
	-- inventory items
	quests ={
		letter=true,

	}
	
	facing=false
	
	inv_counter=0
	
	
--	frozen={
--			lock=false,
--			x=0,
--			y=0,
--		}
	
--	function _player_freeze()
--		if not frozen.lock then
--			frozen.x=player.x
--			frozen.y=player.y
--			frozen.lock=true
--		end
--		if frozen.lock then
--			player.x=frozen.x
--			player.y=frozen.y
--		end
--	end
	
	
	
	
	
	--TRANSITION
	transition=false
	transition_done=false
	transition_reverse=false
	counter=0
	
	
	function _trans_reset()
		transition=false
		transition_done=false
		transition_reverse=false
		
		
		trees={
	-- upper green
		-- -50
		one=-100,
		--  10
		two=-80,
		
	-- upper red
		-- -20
		three=-70,
		--  40
		four=-100,
		
	-- normal red
		-- -20
		five=-100,
		--  40
		six=-80,
		
	-- normal green
		-- -50
		seven=-110,
		--  10
		eight=-100,
	
	}
		
	end
	
	trees={
	-- upper green
		-- -50
		one=-100,
		--  10
		two=-80,
		
	-- upper red
		-- -20
		three=-70,
		--  40
		four=-100,
		
	-- normal red
		-- -20
		five=-100,
		--  40
		six=-80,
		
	-- normal green
		-- -50
		seven=-110,
		--  10
		eight=-100,
	
	}
	
	-- ^ transition section end ^
	
	
	-- animation clock
	frame=0
	
	
	-- animation states
	tent=70
	waterripple=49
	docklegs=62
	inv_y_ani=0
	
	boat={
		show=true,
		x=24,
		y=115,
		
	
	}
	





end


-->8
function _draw()
	cls(4)
	
	-- gameplay
	
	-- lake with 4 docks, 
	-- each dock has a different
	-- side quest that you need 
	-- to complete to get an item
	-- you need all items to open 
	-- a gate
	
	-- boat driving yippp
	
	
	
	
	-- player animation
	-- left
	if not player.inv and page==3 and btn(0) then
		if frame % 3 == 0 then
						facing=false
						player.spr = (player.spr==90) and 91 or 90
		end
	
	
	-- right
		elseif not player.inv and page==3 and btn(1) then
			if frame % 3 == 0 then
							facing=true
							player.spr = (player.spr==90) and 91 or 90
			end
		
		
		-- up
		elseif not player.inv and page==3 and btn(2) and not (btn(0) or btn(1)) then
			if frame % 3 == 0 then
							facing=false
							player.spr = (player.spr==92) and 93 or 92
			end
	
		
		-- down
		elseif not player.inv and page==3 and btn(3) and not (btn(0) or btn(1)) then
			if frame % 3 == 0 then
							facing=true
							player.spr = (player.spr==94) and 95 or 94
			end
	end
	
	
	
	
	
	
	
	
	-- water ani
	if frame % 30 == 0 then
				waterripple = (waterripple==49) and 68 or 49
				docklegs = (docklegs==62) and 63 or 62
				
	end
	
	-- boat ani
	if boat.show then
		if frame % 2 == 0 then
					boat.y = (boat==115) and 116 or 115
					if boat.x<=170 then
					boat.x+=1
					else
					boat.show=false
					end
					
		end
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	if page==1 then
		
		if not page1music then
			music(0)
			page1music=true
		end
		
		
		-- sky
		circfill(107, 107, 70, 7)
		-- lighter sky
		circfill(114, 114, 68, 8)
	
		-- red trees
		sspr(80, 0, 16, 16, 0.5, 72, 40, 40)
	
	 -- green trees
		sspr(64, 0, 16, 16, -10, 72, 40, 40)
		sspr(64, 0, 16, 16, 10, 72, 40, 40)
		
		-- water
		rectfill(0, 112, 128, 128, 10)
		map(waterripple+9, 13, 36, 112, 5, 2)
		-- grass base layer
		map(0, 0, 0, 112, 16, 2)
		
		-- title
		sspr(0, 32, 48, 16, 6, 6, 102, 32)
		
		-- tent
		if tent==1 then
		sspr(48, 32, 16, 16, 77, 70, 48, 48)
		else
		sspr(64, 32, 16, 16, 77, 70, 48, 48)
		end
		
		-- chest
		sspr(24, 48, 8, 8, 99, 103, 16, 16)
		
		
		--tent foliage
		-- right
		sspr(0, 48, 8, 8, 98, 106, 24, 24)
		-- left
		sspr(0, 48, 8, 8, 65, 98, 16, 16)
		-- leaves
		sspr(8, 48, 8, 8, 85, 108, 16, 16)
		
		-- foliage by trees
		spr(97, 2, 107)
		spr(97, 5, 107)
		spr(97, 10, 107)
		spr(97, 17, 107)
		spr(97, 25, 107)
		spr(97, 30, 107)
		
		
		--river stuff
		sspr(0, 56, 8, 8, 58, 117, 8, 8)
		
		--wim
		sspr(80, 48, 8, 8, 58, 98, 24, 24)
		
		print("❎ TO BEGIN", 13, 50, 8)
		
	end


	if page==2 then
	cls(9)
	map(32, 0, 0, 0)
	

	
	-- left tears
	spr(101, 20, 20)
	spr(101, 20, 28)
	spr(101, 20, 36)
	spr(101, 20, 44)
	spr(101, 20, 52)
	spr(101, 20, 60)
 spr(101, 20, 68)
 spr(101, 20, 76)
 spr(101, 20, 84)
 spr(101, 20, 92)
 spr(101, 20, 100)
 
 -- right tears
	spr(102, 100, 20)
	spr(102, 100, 28)
	spr(102, 100, 36)
	spr(102, 100, 44)
	spr(102, 100, 52)
	spr(102, 100, 60)
 spr(102, 100, 68)
 spr(102, 100, 76)
 spr(102, 100, 84)
 spr(102, 100, 92)
 spr(102, 100, 100)
 
 rectfill(28, 20, 100, 107, 12)

	print("EXPEDITION TO:\nAZIMUTH TEMPLE", 28, 22, 1)
		
	print("PERMITTED ONLY TO:\n1X wIM rEED \n1X fROG tEDDY", 28, 36, 1)
	
	print("GRANTED BY:\nLYLE AVERY\nOF THE\n\tmINATO cITY \n\tINSTITUTE OF\n\tARCHEOLOGY", 28, 57, 1)
	
	if counter>=130 then
		print("🅾️ TO CONTINUE", 36, 113, 1)
		print("🅾️ TO CONTINUE", 35, 112, 12)
	end
	
	spr(6, 93, 23)
	sspr(24, 56, 8, 8, 78, 81, 24, 24)
		
	
	
	
	end

	
	if page==3 then
		cls(10)
		map(waterripple, 0, 0, 0)
		
		
		if part==1 then

			-- dock legs
			spr(docklegs, 32, 112)
			spr(docklegs, 24, 112)
			spr(docklegs, 16, 112)
			map(16, 16, 0, 0)
			
			-- boating away
			if boat.show then
			spr(103, boat.x, boat.y, 2, 1)
			end
			
			
			spr(tent, 29, 60, 2, 2)	
			
			if player.x>=124 then
				player.x=0
				part=2
				
			end
			
			
		elseif part==2 then
			map(32, 16, 0, 0)
			
			if player.x<=0 then
				player.x=123
				part=1
				
			end
			
		end



		-- player sprite
		spr(player.spr, player.x, player.y, 1, 1, facing)
			



		if not player.inv then
			-- inv icon
			print("🅾️", 120, 107, 5)
			spr(14, 110, 110, 2, 2)
		end
		
	end

	if player.inv then
		if inv_y_ani<=5 then
			inv_y_ani+=1
		end
		if not (btn(0) or btn(1) or btn(2) or btn(3)) then
				player.spr=107
		end
			-- bg
			map(5, 4, 22, 30-inv_y_ani, 10, 8)
--			circfill(62, 53, 10, 10)
			print("INVENTORY", 44, 39-inv_y_ani, 5)
			-- air baloon
			spr(1, 54, 50-inv_y_ani, 2, 2)
			
			-- trees
			spr(10, 46, 60-inv_y_ani, 2, 2)
			spr(10, 63, 60-inv_y_ani, 2, 2)
			
			-- frog teddy yayy
			spr(21, 38, 54-inv_y_ani)
			
			-- letter
			spr(108, 38, 70-inv_y_ani)
	
			-- letter
			spr(7, 46, 78-inv_y_ani)
	
			
	else
	 inv_y_ani=0
	end

	








	if transition==true then
	-- target positions
	
-- upper green
		sspr(64, 0, 16, 16, trees.one, -60, 144, 144)
		sspr(64, 0, 16, 16, trees.two, -52, 144, 144)
		
--		-- upper red
		sspr(80, 0, 16, 16, trees.three, -40, 144, 144)
		sspr(80, 0, 16, 16, trees.four, -60, 144, 144)
--	
	
--		-- red trees
		sspr(80, 0, 16, 16, trees.five, 1, 144, 144)
		sspr(80, 0, 16, 16, trees.six, 1, 144, 144)
--	
--	 -- green trees
		sspr(64, 0, 16, 16, trees.seven, 2, 144, 144)
		sspr(64, 0, 16, 16, trees.eight, 2, 144, 144)
--		
		if frame % 1 == 0 then
		-- tree one
			if trees.one<=-50 then
				trees.one+=4
			end
		-- tree two
			if trees.two<=10 then
				trees.two+=4
			end
		-- tree three
			if trees.three<=-20 then
				trees.three+=4
			end
		-- tree four
			if trees.four<=40 then
				trees.four+=4
			end
		end
	
		if frame % 2 then 
		-- tree five
			if trees.five<=-20 then
				trees.five+=4
			end
		-- tree six
			if trees.six<=40 then
				trees.six+=4
			end
			-- tree seven
			if trees.seven<=-50 then
				trees.seven+=4
			end
			-- tree eight
			if trees.eight<=10 then
				trees.eight+=4
			end
		end
		
		
		-- check if screen is covered
		if trees.four>=40 then
			if counter>=45 then
				transition_done=true
			end
		end
		
		
		
		
		
		
		
		
		
		-- when transition reverse true
		-- reverse animation
		if transition_done==true then
			
			
			-- tree one
			if trees.one<=200 then
				trees.one+=5
			else
				transition=false
				counter=0
			end
			-- tree two
			if trees.two<=200 then
				trees.two+=3
			end
			
			
			-- tree three
			if trees.three<=200 then
				trees.three+=5
			end
			-- tree four
			if trees.four<=200 then
				trees.four+=3
			end
			
			-- tree five
			if trees.five<=200 then
				trees.five+=4
			end
			-- tree six
			if trees.six<=200 then
				trees.six+=2
			end
			
			-- tree seven
			if trees.seven<=200 then
				trees.seven+=6
			end
			-- tree eight
			if trees.eight<=200 then
				trees.eight+=3
			end

		
		
		
		
		end
		
	
	end
	
	


end
-->8
function _update()
	
	frame+=1
	counter+=1
	inv_counter+=1
	

-- reset transition values
	if not transition then
		_trans_reset()
	end






-- movement physics etc
-- left
if not player.inv and page==3 and btn(0) then
	player.x-=1
		
end
-- right
if not player.inv and page==3 and btn(1) then
	player.x+=1
		
end
-- up
if not player.inv and page==3 and btn(2) then
	player.y-=1
		
end
-- down
if not player.inv and page==3 and btn(3) then
	player.y+=1
		
end


-- inv
-- close

	-- open inv
	if page==3 then
		if not player.inv and inv_counter>=3 and page==3 and btnp(4) then
			counter=0
			player.inv=true
		
		elseif inv_counter>=3 and btnp(4) then
			counter=0
			player.inv=false
			player.spr=90
				
		end
	end






















	-- page 1

	if page==1 and btnp(5) then
		transition=true
		counter=0
	

	
	end
	
	if page==1 and transition_done then
		page=2
		music(-1)
		music(1)
		transition_reverse=true
	end
	
	
	
	
	
	
	
	
	
	
	
	
	-- page 2
	
	if page==2 and btnp(4) and counter>=130 then
		transition=true
	
		
	
	end
	
	if page==2 and counter>=130 and transition==true and transition_done then
		page=3
		music(-1)
		music(2)
		transition_reverse=true
	end



	





end
__gfx__
000000000000004477000000ddddddddddddeddd00000000000000000000e0000000000000000000000000000000000000000000000000000000000880000000
000000000000025665700000ddddddddddddedfd00fef00000f7e000000ddde00000000e0000000000000007000000000000000d000000000000008008000000
000000000000265665670000ddddddddddedfded0d50de000d5ffe000e00df000000000e0000000000000007000000000000000d000000000000080008000000
000000000002655665567000dddddddddddddddd0fe5efd00dd5e7e0dde050000000000e0000000000000007000000000000000d000000000000080000800000
000000000002656666567000dddddddddd5d5ddd00d5f50000d5f500005050000000001fe0000000000000167000000000000012d00000000000800000800000
000000000002656666567000ddddddddddd55ddd0005500000055000001511000000001fe0000000000000167000000000000012d00000000055000000080000
000000000002656666567000dddddddddddd55dd0999999009999990099999900000011dfe0000000000011367000000000001152d0000000555550000080000
000000000002655665567000dddddddddddddddd0099990000999900009999000000011dfe0000000000011367000000000001152d0000000155555500800000
000000000000265665640000dddddddddddddddd0cc00cc000000000edfdeded0000011dfe0000000000011367000000000001152d0000005115555555400000
000000000000025665400000dddddddddddddddd0c9ff9c000000000dfffdded0000011dfe0000000000011367000000000001152d0000005511555555400000
000000000000005245000000ddddddddddeddddd00ffff0000000000df5fdffe000011dddfe0000000001122367000000000115552d000005556655555400000
00000000000000c00c000000ddddddddedfddddd00ffdf0000000000d55ddffe000011dddfe0000000001122367000000000115552d000005556671111400000
0000000000000c0000c00000ddddddddfdddddddeffffffe00000000ededffff000011dddfe0000000001122367000000000115552d000005555775555400000
0000000000000c0040c00000ddddddddeddfdddd00f88f0000000000ddfdffff0000011ddf000000000001123600000000000115520000005555555554000000
000000000000005256000000dddddddddddedddd00f88f0000000000dffedd5d00000015d0000000000000153000000000000015500000000555555554000000
000000000000002525000000dddddddddddddddd0ff00ff000000000ed55de550000000500000000000000050000000000000005000000000005555540000000
d06000000000000f00000000d00000000000000ddddddeddddedddddd00000000000000d5d6dd5fdfdeddefdffeddeddddd0000000000ddd55555555ddd5dddd
f50000000000000d0cc0c000f00000000000000ffdddddfddfdddddfdf000000000000fd06550d5000000d00fffededddedd000000000ddd85585585dddd8ddd
5d600000000000dd00000000ed000000000000deedddddd00ddddddedd000000000000dd0000660600000000f5feffeddd555555555555de85585585d8dd5ddd
d0600000000000ed00000000d00000000000000dddeddd0000dddedddd000000000000dd000000000000000055ddffedd55151515151515d85585585ddddd8d8
d50000000000e0fd00000000d00000000000000dddedd000000ddedddde0000000000edd0000000000000000dddffffe555151515151515d55855858dddddddd
6500000000000fdd00000000e00000000000000eddfdd000000ddfddddf0000000000fdd0000000000000000dedffffed55151515151515d55855858d5d8dd5d
d6d0000000e0dddd000c0cc0d00000000000000ddddd00000000ddddddd0000000000ddd0000000000000000deddd5dddd515151515151dd55855858ddddd8dd
5ddddddd0dedfedd00000000f06000000000000fdfd0000000000dfddfd0000000000dfd0000000000000000fdedd55ddd5555555555555d55555555dddddddd
5ddddddd0dedfedd8b888b48d06000000000000ddfd0000000000dfddfd0000000000dfd0000000000000000ddeddeffdfd9990009999dfd9599995995999959
d6d0000000e0dddd84080880f50000000000000dddd0000000000ddddddd00000000dddd0000000000000000ddedefffdfd0000000000dfd0510915005109550
6500000000000fdd000000005d6000000000000eddf0000000000fddddfdd000000ddfdd0000000000000000deffef5fddd0000000000dddc5100050c550005c
d50000000000e0fd00000000d06000000000000fdde0000000000eddddedd000000ddedd0000000000000000deffdd55ddf0000000000fdd05c00c5c00c000c0
d0600000000000ed00000000d50000000000000ddd000000000000ddddeddd0000dddedd0000000000000000effffddddde0000000000edd0000000000000000
5d600000000000dd0000000065000000000000eedd000000000000ddedddddd00dddddde0000000000000000effffdeddd000000000000dd0000000000000000
f50000000000000d00000000d60000000000000ddf000000000000fdfdddddfddfdddddf00e0000000000d00dd5dddeddd000000000000dd0000000000000000
d06000000000000f000000005000000000000000d00000000000000ddddddeddddeddddd0dedfeddfdeddefdd55ddedfdf000000000000fd0000000000000000
00000000000000a00000000000000a00000000000000000000000000000000000000000000000000588888505888885000000000000000000000000000000000
0000f00000000a7a000002330000a9a00000000000000000000000000000000000000000000000005c989c5059c89c5000000000000000000000000000000000
0000f0f0f0000fa00000177730000a00000000000000000000000000000000000000000000000000085558000855580000000000000000000000000000000000
0001eef0f0dfe00000001747300000d001ddee00e070000000000000000000000000000000000000005850000058500000000000000000000000000000000000
001f00ef0df0de00000013733000000d1dfe0000e070000000000000000000000000000000000000066666000666660000000000000000000000000000000000
01f0000edf000de00000023300000001df000000d050000e00000233330000000000023333000000086668008066608000000000000000000000000000000000
01f0080edf000de0000000000000001df000f000150a0afe0000023323332800000002333332880000d0d00000ddd00000000000000000000000000000000000
1f00878de00000de000000f0000001df00f0f0001daaaafe00002823333320800000282333232080002020000202000000000000000000000000000000000000
1f0008dde00000de000001fe000001ddfff0f0001dd9a9fe0002181233333280000218123233328009999000099990000999a0000999a0000999900009999000
1f00000de00000de000001fe000000001dfef0f001da9afe00021812332332080002181233333208091119000911190009999a0009999a000911190009111900
1f00000de00000de000001fe000000f0001def0001d999fe00211811233323280021181123332328096161900961619009555900095559000961690009616900
1f00000de00000de000001fe00000dd00001fe0001d99fe000218111233333280021811123323328091119900911199005222500052225000911190009111900
1f00000de00000de000001fe000000df01ddfe0001d99fe002118117723233320211811772333332099949000999490009575900095759000999449009994490
1f00000d000000de00001ddfe00000d01ddfe00001d99fe002118777723232320211877772333332009449900094499000555900005559000494494004944940
1f000000000000de0011dd0dfee001dddffe0000001dfe0021187777dd23333d21187777dd23333d000440900054409000944100001440000004459000544090
000000000000000001ddd000dfee000000000000001dee002dd8dddddd233ddd2dd8dddddd233ddd005005000000500000100000000001000050000000000500
000000000000000000aa0500000000a000000080000ccccccccc00000000000bb000000000000000099990000999a00000000000000000000000000000000000
0000000000000000a33aa30000000d000000000000cccccccccc0000000000bbb0000000000000000911190009111a00ccccccc0000000000000000000000000
00000000000000000a3a3aa000004440000000000cccccccccccc00000014db550000000000000000961619009616a001ccccc10600006000000000000000000
00000000000000000003aa3005555550000000000cccccccccccccc0331000ddddb888cc000000000911199009999400c11c11c0060600600000000000000000
000e00000000000e000033a061555516800000000cccccccccccccc0333800dd0888cc00000000000999490049554900ccc3ccc0006a66a60000000000000000
0e0f0de060e000000000a5a05117711500000000022cccccccccccc005c88888888c0000000000000054499004555900ccccccc0000600600000000000000000
0f0d0f00e00006000000550055555555000000000002cccccccccc2095cc8888ccc0000000000000000050900057590000000000000000000000000000000000
0d000d000600e0060000055065555556008000000002ccccccccc200000000000000000000000000000000000015010000000000000000000000000000000000
00000000000000000000005000333300dddddddd000000000000000000000000000000000000000888888888800000000000000088888888bbbbbbbb00000000
00050000000000000000005003003330dddddddd00000000000000000000000000000000000000088888b888800000000000000000888880b444444b00000000
00005000000800000000005030000333dddddddd0000000000000000000000000000000c0000008888888888880000000000000000008800b444444b00000000
00000000480480000000005533030333d555555d0000000000000000c0cc00000cc000000000008888888888880000000000000000000000b444444b00000000
005050500400400000000050330000036155551600000000c0cc000000000000000000000000088888888888888000000000000000000000b444444b00000000
5005500000000080000005503330030351177115000000000000000000000c00000000000000088888888888888000000088000000000000b444444b00000000
050055000088004800000500033300305555555500000000000000000000c00c00000c0c000000888b8888b8880000000888880000000000b444444b00000000
0000000004400004000055000033330065555556000000000000cc0c00000000000000000000000888888888800000008888888800000000bbbbbbbb00000000
__label__
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuubbuuuuuuuuuuuuuuuuucc99ccuuuuuuuuuuuoo8888uuuuuuuuuccssccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuubbuuuuuuuuuuuuuuuuucc99ccuuuuuuuuuuuoo8888uuuuuuuuuccssccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuubbuubbuubbuuuuuuuuubbccuuuuuuuuuuu2299999988uuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuubbuubbuubbuuuuuuuuubbccuuuuuuuuuuu2299999988uuuuuuuuuccuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuu222qqqqbbuubbuurrbbbqquuuuuuuuuuuuuuu2299uu9988uuuuuuuuuuurruuuu22rrrrrqqqquuuuqquu99uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuu222qqqqbbuubbuurrbbbqquuuuuuuuuuuuuuu2299uu9988uuuuuuuuuuurruuuu22rrrrrqqqquuuuqquu99uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuu22bbbuuuuqqbbuurrbbuuurrqquuuuuuuuuuuuu2288998888uuuuuuuuuuuuurr22rrbbqqquuuuuuuuqquu99uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuu22bbbuuuuqqbbuurrbbuuurrqquuuuuuuuuuuuu2288998888uuuuuuuuuuuuurr22rrbbqqquuuuuuuuqquu99uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuu22bbuuuuuuuuuqqrrbbuuuuuuurrqquuuuuuuuuuuuuoo8888uuuuuuuuuuuuuuu22rrbbuuuuuuuuuuuuurruukkuuuuuuuuuqquuuuuuuuuuuuuuuuuuuu
uuuuuuuu22bbuuuuuuuuuqqrrbbuuuuuuurrqquuuuuuuuuuuuuoo8888uuuuuuuuuuuuuuu22rrbbuuuuuuuuuuuuurruukkuuuuuuuuuqquuuuuuuuuuuuuuuuuuuu
uuuuuuuu22bbuuuuunnuuqqrrbbuuuuuuurrqquuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrbbuuuuuuubbuuuuuu22kkuucccuuccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuuuu22bbuuuuunnuuqqrrbbuuuuuuurrqquuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrbbuuuuuuubbuuuuuu22kkuucccuuccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuunn99nnrrqquuuuuuuuuuurrqquuuuuuuuuuuuubbuuuuuuuuuuuuu22rrbbuuuubbuuubbuuuuuu22rrcccccccccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuunn99nnrrqquuuuuuuuuuurrqquuuuuuuuuuuuubbuuuuuuuuuuuuu22rrbbuuuubbuuubbuuuuuu22rrcccccccccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuunnrrrrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuu22rrrrbbbbbbuuubbuuuuuu22rrrrsssccssbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuunnrrrrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuu22rrrrbbbbbbuuubbuuuuuu22rrrrsssccssbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuuuuuu22rrbbqqqbbuubbuuuu22rrcccssccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuuuuuu22rrbbqqqbbuubbuuuu22rrcccssccbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuubbuuuuuu22rrrqqbbuuuuuu22rrsssssssbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuubbuuuuuu22rrrqqbbuuuuuu22rrsssssssbbqquuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuurrrruuuuuuuu222bbqquuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuurrrruuuuuuuu222bbqquuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuurrbbuu22rrrrrbbqquuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurrqquuuuuuuuuuurrqquuuuuuuuuuu22bbqquuuuuuuuuuuuurrbbuu22rrrrrbbqquuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurruuuuuuuuuuuuurrqquuuuuuuuu22rrrrbbqquuuuuuuuuuurruu22rrrrbbbqquuuuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuurruuuuuuuuuuuuurrqquuuuuuuuu22rrrrbbqquuuuuuuuuuurruu22rrrrbbbqquuuuuuuu22rrsssssbbqquuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuuuuuuuuuuuuuuuuurrqquuuu22222rrrruurrbbqqqquuuuu22rrrrrrbbbbqqquuuuuuuuuuuu22rrrbbqquuuuuuuuuuuuuuuuuuuuuuuu
uuuuuu22bbuuuuuuuuuuuuuuuuuuuuuuuuuurrqquuuu22222rrrruurrbbqqqquuuuu22rrrrrrbbbbqqquuuuuuuuuuuu22rrrbbqquuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrrrrrruuuuuurrbbqqqqquuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrrqqqquuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrrrrrruuuuuurrbbqqqqquuuuuuuuuuuuuuuuuuuuuuuuuuuuu22rrrqqqq999999999999uuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999999999999999uuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999999999999999999999uu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999999999999999999999999999999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999999999999999999nnnnnnnnnnnnnnnnn99999
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuunnnnnuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuunnununnuuuuunnnuunnuuuuunnuunnnuunnunnnunnuuuuuuuuuu99999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuunnnunnnuuuuuunuununuuuuunnuunnuunuuuunuununuuuuuuuu999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuunnununnuuuuuunuununuuuuunununuuununuunuununuuuuuu999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuunnnnnuuuuuuunuunnuuuuuunnnuunnunnnunnnununuuuuu999999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu9999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu999999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu99999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuuuu99999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuuuuuqquuuuuuuu99uuuuuuuuqquuuuuuuuuuuu9999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuu222bbqqquu222pp999uu222bbqqquuuuuuuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuu222bbqqquu222pp999uu222bbqqquuuuuuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuu222bbqqquu222pp999uu222bbqqquuuuuuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
uuuuu222bbqqquu222pp999uu222bbqqquuuuuuuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888nnnnnnnnnnnnnnnnnnnnn
uuuuu222bbqqquu222pp999uu222bbqqquuuuuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888nnnnnnnnnnnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888nnnnnnnnnnnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888888ooonnnnnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuu999999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888888ooonnnnnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo888888888888888ooonnnnnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooonnnooo888888888ooo888ooonnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooonnnooo888888888ooo888ooonnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooonnnooo888888888ooo888ooonnnnnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo222nnn222ooo888ooo888888888ooonnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuu99999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo222nnn222ooo888ooo888888888ooonnnnnnnnn
uuu22222rrbbbqq22288ppp22222rrbbbqquuu9999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo222nnn222ooo888ooo888888888ooonnnnnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq9999999999nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnooo222nnn222ooo888888888888888ooonnnnnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq9999999999nnnnnnnnnnnnnssssssssssssnnnnnnnnnnnnnooo222nnn222ooo888888888888888ooonnnnnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq9999999999nnnnnnnnnnnnnssssssssssssnnnnnnnnnnnnnooo222nnn222ooo888888888888888ooonnnnnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq999999999nnnnnnnnnnnnnnssssssssssssnnnnnnnnnnooo222222nnn222222ooo888888888ooo888ooonnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq999999999nnnnnnnnnnnnnnsss222222222sssnnnnnnnooo222222nnn222222ooo888888888ooo888ooonnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq999999999nnnnnnnnnnnnnnsss222222222sssnnnnnnnooo222222nnn222222ooo888888888ooo888ooonnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq999999999nnnnnnnnnnnnnnsss222222222sssnnnnnnnooo222nnn222222222ooo888888occ888888ooonnnnnn
22222rrrrrrrrbbqqqoo22222rrrrrrrrbbqqq999999999nnnnnnnnnnnnnnsssppp222ppp222sssnnnnooo222nnn222222222ooo888888occ888888ooonnnnnn
uuu22222rrrrrbb222oo88822222rrrrrbbuu9999999999nnnnnnnnnnnnnnsssppp222ppp222sssnnnnooo222nnn222222222ooo88888rroo888888ooonnnnnn
uuu22222rrrrrbb222oo88822222rrrrrbbuu999999999nnnnnnnnnnnnnnnsssppp222ppp222sssnooo222222nnn222222999999ooo88rr88888888888ooonnn
uuuuu222kkrrruu222kk888uu222kkrrruuuu999999999nnnnnnnnnnnnnnnsss222222222ssssssnooo222222nnn222222999999ooouuuuuu888888888ooonnn
uuuuu222kkrrruu222kk888uu222kkrrruuuu999999999nnnnnnnnnnnnnnnsss222222222ssssssnooo222222nnn222222999999ooouuuuuu888888888ooonnn
uuuuu222kkrrruu222kk888uu222kkrrruuuu999999999nnnnnnnnnnnnnnnsss222222222ssssssnooo222222nnn999999999kkkkkkkkkkkk888888888ooonnn
uuuuuuuukkuuuuuuuukkuuuuuuuukkuuuuuuu999999999nnnnnnnnnnnnnnnsssssssssuuusssbnnnooo222222nnn999999999kkkkkkkkkkkk888888888ooonnn
uuuuuuuukquuquuuuqkkuuuuquuukkuuquuuuq99999999nnnnnnnnnnnnnnnsssssssssuuusssbnnnooo222222nnn9999999pp22kkkkkkkk22pp8888888ooonnn
rrprqprqrrprqrrrrprqrrrrrprqrrprqbrcccccccccccccrrqrrrrrrrrrqsssssssssuuusssrooo222222nnn9999999999pp22kkkkkkkk22pp8888888rrrrrr
rrqrrqrprrqrrrrprqrrrrprrqrrrrqrrrrpccccccccccccrbrrrrrbrrrrqrbrkkkuuuuuusssssso222222nnn9999999999kk222299992222kk8888888rrrrrr
rrrprrprrqqpprqrrpprrqrrprprrqrpprqccpcccccccccccrrrrrrqrrqrbrqrkkkuuuuuusssssso222222nnn9999999999kk222299992222kk8888888rrrrrr
rrrrrrrrqrbrrrrrrrrrrrrrqrbrrrrrrrqcccccccccccccccrrrqrrrrrrrrrrkkkuuuuuussssssorrrrrrnnnrrrrrrrrrrkkkkkkkkkkkkkkkk8rrrrrrrrrrrr
rrrrrrrrbrrrrrrrrrrrrrrrbrrrrrrrrrcccccccccccccccccrrqrrrrkrkrrrrrrrrrkkkrrrsssorrrrrrnnnrrrrrrrrrrqqkkkkkkkkkkkkkk8rrrrrrrrrrrr
rrrrrrrrqrrbrrrrrrrrrrrrqrrbrrrrrrcccccccccccccccccrrbrrrrrkkrrrrrrrrrkkkrrrsssorrrrrrnnnrrrrrrrrrrqqkkkkkkkkkkkkpp8rrrrrrrrrrrr
rrrrrrrrrrrqrrrrrrrrrrrrrrrqrrrrrbccccccccccccccccccrrrrrrrrkkrrrrrrrrkkkrrrsssrrrrrrpprrqqrrrrrrrrppkkkkkkqqqkkkpprrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrccccccccccccccccccccrbrrrrrrrkrrrrrrrrrrrrrrrrrrrrrrpprrqqrrrrrrrrrrrrrrrrqqqrrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrcpccccccccccccccccccccccrqrbqrrrrrrrrrrrrrrrrrrrrrrrqqrrrrrrrrpprrrrrrrrrrqqqrrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrbkccccccccccccccccccccccccqckrkrkrrrrrrrrrrrrrrrrrrrrqqrrrrrrrrpprrrrqqqrrrbbbrrrrrrqqqrrrrrrrrr
rrqrrrrrrrrrrrrrrrqrbrqrrrrrrrrrkrpccccccccccccccccccccccckcckkrrrrrrrrrrrrrrrrrrrrrrrrpprrrrqqrrrrppqqqrrrbbbrrrrrrqqqrrrrrrrrr
qrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrcpcccccccccccccccccccccccckqckkrrrrrrrrrrrrrrrrrrrrrrrpprrrrqqrrrrppqqqrrrbbbrrrrrrqqqrrrrrrrrr
brrrrrrrrrrrrrrrrrkrkrrrrrrrrrrrrkccccccccccccccccccccccccccccqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbbbrrrrrrrrrbbbrrrrrrrrrrrr
qrrbrrrrrrrrrrrrrrrkkrrrrrrrrrrrpkccccccccccccccccccccccccccccrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbbbrrrrrrrrrbbbrrrrrrrrrrrr
rrrqrrrrrrrrrrrrrrrrkkrrrrrrrrrrrpcccccccccccccccccccccccccccccrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbbbrrrrrrrrrbbbrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkccccccccccccccccccccccccccccccbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr

__gff__
0000000000000000010101010101000000000000000000000101010101010000010100010001010101010100000001000101010100010101010101000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0314031435002604030303030303030300000000000000000000000000000000646464646464646464646464646464640076000000000000780000000000760000000000000000000000007600000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1403040333000031030303030303030300000000000000000000000000000000646464646464646464646464646464640000007700760000000000007700000000000000000076007700000000000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000000000000000007600000000760000000000000000000000000077000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000760000007600000000000000000000000000007700000077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007c7c7c7c0000000000000000000000000000000000000000646464646464646464646464646464640000000000000000000000760000000000000000000000000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007c797a7a7a7a7b7c000000000000000000000000000000000000646464646464646464646464646464640076000000760077000077000000760000000000770000007700760000760000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000797a7a7a7a7a7a7a7a7b0000000000000000000000000000000000646464646464646464646464646464640000007700000000000000000000000000000000000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000797a7e7a7a7a7a7e7a7b0000000000000000000000000000000000646464646464646464646464646464640000000000000000760000760000000000000000000000000000007700007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000797a7a7a7a7a7a7a7a7b0000000000000000000000000000000000646464646464646464646464646464640000007600000000000000000000770000000000000077000000000000000000007600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000797a7e7a7a7a7a7e7a7b0000000000000000000000000000000000646464646464646464646464646464640000000000007700000000000000000000000000000000000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000797a7a7e7e7e7e7a7a7b0000000000000000000000000000000000646464646464646464646464646464640076000076000000000000780000000000000000770000770000000000007600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007d7d7d7d7d7d7d7d000000000000000000000000000000000000646464646464646464646464646464640000000000000000760000000000760000000000000000000000007700000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000770000000000000000000000000000000000007600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000007600007600000076000000007600000000000077000077000000770000000077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000000000000000000000007700000000000000000000000000000000000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000760000000076007600000000000000000000007700000000770077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b17171717173324171717171717172b171717171717171717171717171717170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14030314143324141414031414133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14031403032c2d031414031414143b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14141403033c3d041414141403133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14031414250000292926141414133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14141414350000000031041414133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b141414143300000000281404141303141414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b141414143300000000381414141403141414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14031414370000003814140314133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14141414742300381414140313133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b14141414142700261414140314133b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000002b252e2604263500361414141414143b3b1414141414141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000025002e002a000000002614141414133b3b2532323226141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000002e2e2e0000000000292a292a2a313b3500000036141414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000290000000000261414141414141414140000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000002617171717171717170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
901400100c05018000180301805023600110501f6001d0301d050006000c05018000240300c0501c600236001f6001c600216001f6001d60024600216001d600246001f6001f600236001d6001f600216001d600
011400100000010050000000000010050000000000010050000000000010050000000000010050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a31400100c5320c5320c5220c5220c5120c5120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a114001011034110341103411034150341503415034150340e0340e0340e0340e0341003410034000340003400034000300003000030000000000000000000000000000000000000000000000000000000000000
011400100c63500635000000000013635000050000000000000000000000000000000c63500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
091400100075500705007550075501705007550770502705007550270500755007550470504705007050070500705007050070500202000020000200002000020000200002000020000200000000000000000000
d31400100c05500055000000000013055000050000000000000000000000000000000c05500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a11400200e055100450e0351002513000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001400200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e010100100e0201002000000000000000000000
__music__
03 00010244
03 04034544
03 05060708

