pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
 poke(0x5f2e,1)
 pal({[0]=0,2,-8,8,-2,-12,-7,9,-9,-4,12,-1,7,-5,-6,11},1)
	
	page=3
	
	-- part of map
	part=4
	
	page1music=false
	
	debug=false
	

	player={
		spr=90,
		inv=false,
		facing=0,
		x=30,
		y=102,
		dx=0,
		dy=0,
		selectbtn=false
		

		
	
	}
	-- inventory items
	quests={
		letter=true,
		bonsai=true,
		boat_ticket=true,
		glasses=true,

	}
	
	facing=false
	x_pressed=false
	inv_counter=0
	
	

	function _cityboats()
		-- randomises sprite & direction
		cityboats.spr=rnd{ 134, 135, 136, 137 }
		cityboats.left=rnd{ true, false, false }
		if cityboats.left then
			cityboats.x=-20
		else 
			cityboats.x=150
		end
	end
	

	
	
	
	
	
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
	waterripple=0
	docklegs=62
	inv_y_ani=0
	-- show fire lit or not
	fire=true
	firespr=131
	
	
	templeboat_spr=194
	
	boat={
		show=true,
		x=24,
		y=115,
		
	
	}
	
		cityboats={
		spr=rnd{ 134, 135, 136 },
		x=-10,
		y=15,

		
	
		}
		
		cityboats2={
		spr=rnd{ 134, 135, 136 },
		x=-10,
		y=15,

		
	
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
				waterripple = (waterripple==0) and 16 or 0
				docklegs = (docklegs==62) and 63 or 62
				
				-- boat to temple
				templeboat_spr= (templeboat_spr==194) and 196 or 194
				
	end
	
	-- boat ani
	if boat.show and page==3 then
		if frame % 2 == 0 then
					boat.y = (boat==115) and 116 or 115
					if boat.x<=170 then
					boat.x+=1
					else
					boat.show=false
					end
					
		end
	end
	
	
	-- city boat ani
	if part==5 then
		if frame % 4 == 0 then
			if cityboats.left then
					if cityboats.x<=170 then
						cityboats.x+=1
						cityboats.isleft=0
					else
					 _cityboats()
					end
			else
				if cityboats.x>=-20 then
						cityboats.x-=1
						cityboats.isleft=1
					else
					 _cityboats()
					end
			
			end
			
			
		end
	end
	
	
	
	
	-- display ❎ to show action
	if page==3 then
		if part==1 and (player.x>=24 and player.x<32) and (player.y>=78 and player.y<86) then
				player.selectbtn=true
		
		elseif part==7 and quests.boat_ticket and (player.x>=68 and player.x<88) and (player.y>=102 and player.y<115) then
				player.selectbtn=true
		
		elseif part==4 and quests.boat_ticket and (player.x>=10 and player.x<25) and (player.y>=50 and player.y<65) then
				player.selectbtn=true
		
		
		else
			player.selectbtn=false
		
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
		map(48, waterripple, 0, 0)
		
		
		
		
		
		-- top middle (home)
		if part==1 then

			-- dock legs
			spr(docklegs, 32, 112)
			spr(docklegs, 24, 112)
			spr(docklegs, 16, 112)
			map(96, 0, 0, 0)
			
			-- boating away
			if boat.show then
			spr(103, boat.x, boat.y, 2, 1)
			end
			
			
			spr(tent, 29, 60, 2, 2)	
			spr(99, 37, 72)
			
			-- fire
			-- if fire out
			if fire==false then
				spr(130, 29, 84)
			else if fire==true then
				spr(firespr, 29, 84)
				
				if frame % 8 == 0 then
					firespr = (firespr==131) and 132 or 131
				end
			end
			end
			
			if player.x>=124 then
				player.x=0
				part=2
				
			end
			
			--trees
			-- entrance to lake
			spr(210, 59, 67, 2, 2)
			
			-- inner right lake tree
			spr(208, 79, 36, 2, 2)
			
			
			
			
			
			
			
			
		
		-- top right	
		elseif part==2 then
			map(112, 0, 0, 0)
			
			-- go to different part if
			-- go back to part one
			if player.x<=-1 then
				player.x=123
				part=1
				-- go to next part
			elseif player.y>=127 then
				player.y=0
				part=3
				
				
			end
			
			
			
			
			
			
			
			
			
			
		-- bottm right
		elseif part==3 then
			map(112, 16, 0, 0)
		
			-- go back
			if player.y<=-1 then
				player.y=127
				part=2
				
			-- go to next part
			elseif player.x<=-1 then
				player.x=127
				part=4
			
			end
			
			
			
			
			
			
			
			
		-- bottom middle
		elseif part==4 then
			map(96, 16, 0, 0)
			
			-- entry/exit boat
			spr(templeboat_spr, 13,45, 2, 1)
		
			
			-- go back
			if player.x>=127 then
				player.x=0
				part=3
				
			-- go to next part
			elseif player.x<-1 then
				player.x=127
				music(-1)
				music(3)
				part=5

			
			end
		
		
		
		
		
		
		
		
		
		
	-- middle left / city
		elseif part==5 then
			map(80, 16, 0, 0)
			
			-- palm trees bottom half
			-- right
			spr(171, 98, 101, 3, 2)
			--left
			spr(171, 66, 101, 3, 2)
			
			-- go back
			if player.x>=127 then
				player.x=0
				part=4
				music(-1)
				music(2)
				
			-- go to next part
			elseif player.x<=-1 then
				player.x=127
				part=6
			
			end
			
			
			-- boats for watching
			-- if they come from the left
			if cityboats.left then
				if cityboats.x<=150 then
					spr(cityboats.spr, cityboats.x, 15)
				else
					_cityboats()
				end
				
			end
			
			-- if left
			if not cityboats.left then
				if cityboats.x>=-15 then
					spr(cityboats.spr, cityboats.x, 15, 1, 1, cityboats.isleft)
				else
					_cityboats()
				end
				
			end


			
			
			
			
			
			
			
			
			
			
			
			
			
			
			-- bottom left / city
		elseif part==6 then
			map(64, 16, 0, 0)
			
			
			-- go back
			if player.x>=127 then
				player.x=0
				part=5
			
			end
			
		
		
		
		-- azimuth temple dock left of camp
		elseif part==7 then
			
			map(80, 0, 0, 0)

			-- dock legs
			spr(docklegs, 72, 120)
			spr(docklegs, 88, 120)
			spr(docklegs, 80, 120)
			
			-- out fire
			spr(130, 90, 30)
			spr(130, 90, 29)
			
			
		end



		-- player sprite
		spr(player.spr, player.x, player.y, 1, 1, facing)
		
		
		-- palm trees top half
		-- so player is behind them
		if part==5 then
			spr(139, 90, 85, 3, 2)
			
			spr(139, 58, 85, 3, 2)
		end
		
		if part==7 then
		 -- dock trees
			spr(208, 91, 85, 2, 2)
			
			spr(208, 58, 85, 2, 2)
			
			-- tree above bridge
			spr(208, 40, 33, 2, 2)
			
			-- tree below bridge
			spr(208, 30, 53, 2, 2)
			
			-- upper left trees
			spr(208, 20, 20, 2, 2)
			spr(208, 10, 23, 2, 2)
			spr(208, 0, 34, 2, 2)
			
			-- upper right trees
			spr(208, 50,6, 2, 2)
			
			-- entry/exit boat
			spr(templeboat_spr, 70,103, 2, 1)
		end
		
		
		-- ❎ to select
		if player.selectbtn==true and counter>=4 then
			if not x_pressed then
				print("❎", player.x+7, player.y-4, 12)
			else
				print("❎", player.x+6, player.y-3, 12)
				player.spr=110
				
				-- toggle if near fire
				if part==1 and (player.x>=24 and player.x<32) and (player.y>=78 and player.y<86) then
					if fire==true then
						fire=false
						counter=0
					else 
						fire=true
						counter=0
					end
					
					
					
				end
				
				
				
				if quests.boat_ticket then
					-- leave part 4 via boat
					-- not working well
					if part==4 and (player.x>=18 and player.x<25) and (player.y>=50 and player.y<65) then
							transition=true
							counter=0
					end
					
					
					-- leave part 7 via boat
					-- working well
					if part==7 and (player.x>=68 and player.x<88) and (player.y>=102 and player.y<115) then
							transition=true
							counter=0
					end
				end
			
			
			end
		end
		
		-- player debugging tools
		if debug then
			print(player.x, player.x+4, player.y-3, 12)
			print(player.y, player.x+4, player.y+1, 12)
		end



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
			
			
			
			
			
			-- quest items if unlocked
			-- show letter in inv if
			if quests.letter then
				-- letter
				spr(108, 38, 70-inv_y_ani)
			end
			
			-- show bonsai in inv if
			if quests.bonsai then
				-- bonsai
				spr(7, 46, 78-inv_y_ani)
			end
			
			-- show boatticket in inv if
			if quests.boat_ticket then
				-- boat ticket
				spr(76, 54, 78-inv_y_ani)
			end
			
			-- show glasses
			if quests.glasses then
				-- glasses
				spr(109, 62, 78-inv_y_ani)
			end
	
			
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
	
-- stop overflow counters
-- revert to 400 as some stuff
-- doesnt work until 350
	if frame>=10000 then
		counter=400
		inv_counter=400
		frame=0
	end
	
	if btn(5) then
		x_pressed=true
	else
		x_pressed=false
	end
	

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
			inv_counter=0
			player.inv=true
		
		elseif inv_counter>=3 and btnp(4) then
			inv_counter=0
			player.inv=false
			player.spr=90
				
		end
	end











	-- page 1

	if page==1 and btnp(5) then
		transition=true
		counter=0
	

	
	end
	
	
	-- best way to play music 
	-- on new scene
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
	




	-- page 3 stuff
	
	-- nottt working, part 4 to 7
--	if page==3 and part==4 and transition_done then
--		part=7
--		if not transition_reverse then
--			music(-1)
--			music(2)
--			player.x=86
--			player.y=111
--		end
--		transition_reverse=true
--	end
--	
--	
--	-- working yaayy
--	-- part 7 to 4
--	if page==3 and part==7 and transition_done then
--		part=4
--		if not transition_reverse then
--			music(-1)
--			music(2)
--			player.x=86
--			player.y=111
--		end
--		transition_reverse=true
--	end


	





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
840808800000005256000000dddddddddddedddd00f88f0000000000dffedd5d00000015d0000000000000153000000000000015500000000555555554000000
8b888b480000002525000000dddddddddddddddd0ff00ff000000000ed55de550000000500000000000000050000000000000005000000000005555540000000
d06000000000000f00000000d00000000000000ddddddeddddedddddd00000000000000d5d6dd5fdfdeddefdffeddeddddd0000000000ddd5555555500000000
f50000000000000d0cc0c000f00000000000000ffdddddfddfdddddfdf000000000000fd06550d5000000d00fffededddedd000000000ddd8558558500000000
5d600000000000dd00000000ed000000000000deedddddd00ddddddedd000000000000dd0000660600000000f5feffeddd555555555555de8558558500000000
d0600000000000ed00000000d00000000000000dddeddd0000dddedddd000000000000dd000000000000000055ddffedd55151515151515d8558558500000000
d50000000000e0fd00000000d00000000000000dddedd000000ddedddde0000000000edd0000000000000000dddffffe555151515151515d5585585800000000
6500000000000fdd00000000e00000000000000eddfdd000000ddfddddf0000000000fdd0000000000000000dedffffed55151515151515d5585585800000000
d6d0000000e0dddd000c0cc0d00000000000000ddddd00000000ddddddd0000000000ddd0000000000000000deddd5dddd515151515151dd5585585800000000
5ddddddd0dedfedd00000000f06000000000000fdfd0000000000dfddfd0000000000dfd0000000000000000fdedd55ddd5555555555555d5555555500000000
5ddddddd0dedfedd8b888b48d06000000000000ddfd0000000000dfddfd0000000000dfd0000000000000000ddeddeffdfd9990009999dfd9599995995999959
d6d0000000e0dddd84080880f50000000000000dddd0000000000ddddddd00000000dddd0000000000000000ddedefffdfd0000000000dfd0510915005109550
6500000000000fdd000000005d6000000000000eddf0000000000fddddfdd000000ddfdd0000000000000000deffef5fddd0000000000dddc5100050c550005c
d50000000000e0fd00000000d06000000000000fdde0000000000eddddedd000000ddedd0000000000000000deffdd55ddf0000000000fdd05c00c5c00c000c0
d0600000000000ed00000000d50000000000000ddd000000000000ddddeddd0000dddedd0000000000000000effffddddde0000000000edd0000000000000000
5d600000000000dd0000000065000000000000eedd000000000000ddedddddd00dddddde0000000000000000effffdeddd000000000000dd0000000000000000
f50000000000000d00000000d60000000000000ddf000000000000fdfdddddfddfdddddf00e0000000000d00dd5dddeddd000000000000dd0000000000000000
d06000000000000f000000005000000000000000d00000000000000ddddddeddddeddddd0dedfeddfdeddefdd55ddedfdf000000000000fd0000000000000000
00000000000000a00000000000000a000000000000000000000000000000000000000000000000005888885058888850000002820b4884b00606b60000ccbcc0
0000f00000000a7a000002330000a9a00000000000000000000000000000000000000000000000005c989c5059c89c500888882845cccc54006a6a6000c5b5c0
0000f0f0f0000fa00000177730000a000000000000000000000000000000000000000000000000000855580008555800088cc8807cccc7c800b6b6b000bbbbb0
0001eef0f0dfe00000001747300000d001ddee00e070000000000000000000000000000000000000005850000058500008cc8880c7c7cc7c000bbb00040b4b04
001f00ef0df0de00000013733000000d1dfe0000e0700000000000000000000000000000000000000666660006666600085c8580cc7a77a70000a0000090a090
01f0000edf000de00000023300000001df000000d050000e0000023333000000000002333300000008666800806660800aa55ac08cc7cc780099a9900099a990
01f0080edf000de0000000000000001df000f000150a0afe0000023323332800000002333332880000d0d00000ddd00009a9a9a0458cc8540049a9400009a900
1f00878de00000de000000f0000001df00f0f0001daaaafe000028233333208000002823332320800020200002020000000000000b4884b00005050000050500
1f0008dde00000de000001fe000001ddfff0f0001dd9a9fe0002181233333280000218123233328009999000099990000999a0000999a0000999900009999000
1f00000de00000de000001fe000000001dfef0f001da9afe00021812332332080002181233333208091119000911190009999a0009999a000911190009111900
1f00000de00000de000001fe000000f0001def0001d999fe00211811233323280021181123332328096161900961619009555900095559000961690009616900
1f00000de00000de000001fe00000dd00001fe0001d99fe000218111233333280021811123323328091119900911199005222500052225000911190009111900
1f00000de00000de000001fe000000df01ddfe0001d99fe002118117723233320211811772333332099949000999490009575900095759000999449009994490
1f00000d000000de00001ddfe00000d01ddfe00001d99fe002118777723232320211877772333332009449900094499000555900005559000494494004944940
1f000000000000de0011dd0dfee001dddffe0000001dfe0021187777dd23333d21187777dd23333d000440900054409000944100001440000004459000544090
000000000000000001ddd000dfee000000000000001dee002dd8dddddd233ddd2dd8dddddd233ddd005005000000500000100000000001000050000000000500
000000000000000000aa0500000000a000000080000ccccccccc00000000000bb000000000000000099990000999a00000000000000000000999900000000788
0000000000000000a33aa30000000d000000000000cccccccccc0000000000bbb0000000000000000911190009111a00ccccccc0000000000911190000300788
00000000000000000a3a3aa000004440000000000cccccccccccc00000014db550000000000e00000961619009616a001ccccc10700007000961690003737888
00000000000000000003aa3005555550000000000cccccccccccccc0331000ddddb888cc0e0f0de00911199009999400c11c11c007070070091119000e307888
000e00000000000e000033a061555516800000000cccccccccccccc0333800dd0888cc000f0d0f000999490049554900ccc3ccc0007a77a7099949000e078888
0e0f0de060e000000000a5a05117711500000000022cccccccccccc005c88888888c00000d000d000054499004555900ccccccc000070070449449005d578888
0f0d0f00e00006000000550055555555000000000002cccccccccc2095cc8888ccc0000000000000000050900057590000000000000000000004459055588888
0d000d000600e0060000055065555556008000000002ccccccccc200000000000000000000000000000000000015010000000000000000000055005088888888
0000000000000000000000500033330000e00dde000000000000000000000000000000000000007888888888870000000000000088888888bbbbbbbb88700000
0005000000000000000000500300333000000d0d0600e006000000000000000000000000000000788888b888870000000000000077888887b444444b88700090
000050000008000000000050300003330dde00dde000060000000000000000000000000c0000078888888888887000000000000000778870b444444b888709a9
00000000480480000000005533030333dddde00060e0000000000000c0cc00000cc000000000078888888888887000000000000000007700b444444b88870090
00505050040040000000005033000003dd0de0000000000ec0cc000000000000000000000000788888888888888700000077000000000000b444444b888870e0
50055000000000800000055033300303dd00d000000000000000000000000c00000000000000788888888888888700000788770000000000b444444b888875d5
050055000088004800000500033300300dd000de00000000000000000000c00c00000c0c000007888b8888b8887000007888887700000000b444444b88888555
00000000044000040000550000333300000000dd000000000000cc0c00000000000000000000007888888888870000008888888800000000bbbbbbbb88888888
dddedd8888eddddd00000000000300000000300088788788000c00000000000000000000000000000000000000000000000fff0000000000dddddddddddddddd
dddddd4884ddeddd00000000000300000f03000088ff87880cccc0000cc5cc000000c0000000000000500000000000fff0eeef0000000000dddddddddddddddd
edddd888888ddedd500000005e373e005e373ef07d3dff7700390000ccc5ccc00005cc000000000000bb007000ffffffdddde00000000000dddddddddddddddd
ded8888888888dde05500005e37673e5e3763ee58dddd3f8c0330cc40cc5cc000005ccc000000000ccb881cc0fffddddd5ddddfeee000000dddd11111111dddd
ddd8888888888dde00050555e3767355e378735583ddddd84cccc4405505000000050000000000000ccc1c000fdddddddd55dddfffeee000ddd11111f1111ddd
d88888488488888d00555100fe6861e0fe6861e07ddd37774444440065550115088880000900099000010000ddddddddd515ffddddffee00d1111111d11f111d
8848888888888488555005005553e5f05552e5f08755587800000000761115503393933399099c1900100000ddddddddf555efffddddfee0d1115555555d111d
888888888888888800000055000ef05500ef0055878588780000000055555500033333000099999000000000ddddddfff551eeef0dddfee01115555555555111
ddddddddddd5ddddeddddeddddee88dddddd8ddd878787877888888778888887878888700788887877d7ed77ddddd0fee55500500ddddfe0115555555555d511
fdddddffdd555ded5dedddd588ddee88d88ddddd787e7778e78888788788887e878888700788887877de7d7e0ddd50000555055500ddddf01d5555555555d5f1
000efddd555555dd58888885ee88ddeed86dd68d88f8e488dd766788887667dd7777777007777777dddddddd000555000155015500ddddf0115f555555d555d1
00000009511115d055dded55ddee88ddddddd88d848d8e88ddddd688886ddddd88870000000078887e7d7e770001550005550010000ddd00d115555d5555511d
00000009555555005d5dd5d588ddee888ddddddd8f8d88e8fdddf688886fdddf8887000000007888e77d77e7000010000555000000000000d1155d5d5555511d
00000009511115005ddd5dd5ee88ddeedd68ddddf85d58e8dddfd788887dfddd7777000000007777dedddddd000000005515000000000000ddd1155555151ddd
00000000555555005ed5dde5ddee88dddddd8dd888858884dfdddf7887fdddfd88700000000007887e7e77d7000000005555000000000000dddd1111111155dd
00000000511115005d5dd5d588ddee88dddddddd87777778dddfddd77dddfddd88700000000007887d7e77d7000000005555000000000000dddddddddddddddd
0000000055555500214bb4124455554488788788788888877888888778888887fffefff77fffeffffffeffff5551000000000000126dd6dd0000000000000000
00000000511115001bb44bb1455855548878878887888878e78888788788887efefffe7887efffefeffeffff15500000000000001226d6dd0000000000000000
00000009555555008bbeebb8555855557777777788788788ff766788887667fffffef788887fefffffffffff55500000000000001526126d0000000000000000
0000000951111500b8ea9e8c588244558887888888876888fffff688886fffffefffe688886efffeffffffef555000000000000055dd126d0000000000000000
0000000955555500c8e9ae8b555422858887888888876888efffe688886efffefffff688886ffffffffffeff5150000000000000ddd112360000000000000000
000efddd511115dd8bbeebb8555422857777777788788788fffef788887fefffff766788887667fffeffffff5550000000000000d3d112260000000000000000
fdddddff5d555ddd1bb44bb1455588548788887887888878fefffe7887efffefe78888788788887effeffffe5510000000000000d2ddd5dd0000000000000000
dddddddddddddedd214bb412445555448788887878888887fffefff77fffefff7888888778888887ffffffff55100000000000002d3dd55d0000000000000000
888888888888888888887d878878e788887000000000078888888888888888887888888700000000dddfdddd11111887ddd5ddd1dd6dd6316d6d6d6d00000000
88488888888884887887dd88887e878e8870000000000788cb888b8b8bc8bcb88780087800000000fddfdddd525111785dd5dddddd6d6321d236dd6d00000000
d88888488488888d78378d88777777777777000000007777bcbbb88c8c88cbc88800008800000000dddddddd25552118ddddddddd6316351d256d13600000000
ddd8888888888dde73a37dd78e878e888887000000007888cb8888cb888cbcb88000000800000000ddddddfd7e525111dd1ddd5dd621dd55d55dd13600000000
ded8888888888dde8e388d88e88788e888870000000078888888bcbc8bcbc8888000000800000000dddddfdde77d5251ddddd5dd63211ddd6d6d112300000000
edddd888888ddedd8e885d587e77777777777770077777778bbbcbc88cbc88c88800008800000000dfdddddddeddd555d5dddddd62211d6ddd2d122300000000
ddeddd4884ddeddd6e6755578e8e88788788887007888878b888bcb88bcb8cb88780087800000000ddfddddf7e7e7752dd5dddd5dd5ddd6dd226dd5d00000000
dddddd8888eddddd66687887878e8878878888700788887888888888888888887888888700000000dddddddd7d7e7725ddddd1ddd55dd6d26d55d65500000000
65666656656565650000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77577775575757570000050009000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
656666566767676722cc45549b44cc22000005000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7757777567676767002cccc9bcccc20022cc45549b44cc2200000000000000000000000000000000000000000000000000000000000000000000000000000000
65666656676767670002229bcc222900002ccc99bcccc20000000000000000000000000000000000000000000000000000000000000000000000000000000000
77577775656565650099955222999990090225cbcc22299000000000000000000000000000000000000000000000000000000000000000000000000000000000
65666656575757570000555000000000009955222299990000000000000000000000000000000000000000000000000000000000000000000000000000000000
77577775676767670000550000000000000c55c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000016700000000000001fe0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000016700000000000001fe0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000113670000000000011dfe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000113670000000000011dfe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000113670000000000011dfe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000113670000000000011dfe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000112236700000000011dddfe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000112236700000000011dddfe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000112236700000000011dddfe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000112360000000000011ddf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000153000000000000015d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000005000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc0000000bb0000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099799000005aba5d00dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cabac0000005550ddd555d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbbbb000000b00000d676d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b44440000ccccc00005550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9bbbbb90004ccc400002520000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
409a9040000c0c000005250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00505000000505000050505000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccc77c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77c7cccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccc7ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7cccccccccccccccccccccccccc
cccccccccccccccccccccccccccc7cc7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7cc7cccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccc77c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccc7c77cccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77c7cccccccccccccccccccccccccccccccccccc77c7cccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccc7c77cccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccc77c7cccccccccccccccccccccccccccc77c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77c7cccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccc
cccccccc7c77cccccccccccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7c77cccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7ccccccccccccccccccccccc7cccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7cc7cccccccccccccccccccc7cc7cccccccccccccccccccccccccccccccccccccccc
cccccccccccc77c7cccccccccccccccccccccccccccc77c7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77c7cccccccc
rbrccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
rrrrcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
rrbrrccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
rrqrrccccccccccccccccccc7c77cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
rrqrrrcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
qrrrrrrcccccccccccccccccccccc7cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
brrrrrbrnucncnncnucncnncnucn7nn7nucncnncnucncnncnucncnncnucncnncnucncnncnucncnncnucncnncnucncnncnucncnncnucncnncnucncnnccccccrcc
rrrrrqrrnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunnvnnnvunbrqrrqbr
rrqrrqbbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnrrqrrqbb
rrqrqbbbnnunnnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnvnnnnnnnnunnrrqrqbbb
rqbbqbkbrnnnnnunnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnunnnnnrrqbbqbkb
rqbbrrkkrrrnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnrrqrqbbrrkk
qbbbbrrrrqrnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnrrqqbbbbrrr
qbbbbrqrqrrrrnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnrrqrrqbbbbrqr
rrkrrrqrrrqrrrunnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnvnnnnvnnurrqrrrrrkrrrqr
rkkrrqrbrrrrrrnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqrrrrrrkkrrqrb
rrqrrqbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrqbb
rrqrqbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrqbbb
rqbbqbkbrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrqbbqbkb
rqbbrrkkqrbrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrqrbrrrrrqrbrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrqrbrrrrrrqbbrrkk
qbbbbrrrbrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrbrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrbrrrrrrrqbbbbrrr
qbbbbrqrqrrbrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrqrrbrrrrqrrbrrrrrrrrrrrrrrrrrrrrqrrbrrrrrrrrrrrrqrrbrrrrqbbbbrqr
rrkrrrqrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrkrrrqr
rkkrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkkrrqrb
rrqrrqbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrqbb
rrqrqbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrqbbb
rqbbqbkbrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbqbkb
rqbbrrkkrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrqrbrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbrrkk
qbbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrbrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbbbrrr
qbbbbrqrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrqrrbrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbbbrqr
rrkrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkrrrqr
rkkrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkkrrqrb
rrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrr
rnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrr
rnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnr
rrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnr
nrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrr
rrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrr
rrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrn
rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
rrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrr
rnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrr
rnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnrrnprrpnr
rrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnrrrrrrnnr
nrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrrnrrrrrrr
rrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrrrrpnrrrr
rrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrnrrrrnrrn
rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
rrqrrqbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrqbb
rrqrqbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrqbbb
rqbbqbkbrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrqrbrqrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbqbkb
rqbbrrkkrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbrrkk
qbbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrkrkrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbbbrrr
qbbbbrqrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrkkrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqbbbbrqr
rrkrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrkkrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkrrrqr
rkkrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkkrrqrb
rrqrrqbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrqbb
rrqrqbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrqbbb
rqbbqbkbrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrqrrrrrrrqrrrrrrqbbqbkb
rqbbrrkkqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrqrbrrrrrqrbrrrrrrkkkkkkk
qbbbbrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrr777r7rbrrrrrrrbrrrrrrrbrrrrrrrkkbbbkkr
qbbbbrqrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrr7r7r7rqrrbrrrrqrrbrrrrqrrbrrrrkkbkbkkr
rrkrrrqrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrr777r777rrqrrrrrrrqrrrrrrrqrnnrkkkrrkkr
rkkrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrs7s7r7r7rrrrrrrrrrrrrrrrrrrnrrnrkkkkkrb
rrqrrqbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrs2777r777r77rrrrrrrrrrrrrrrnrrrnrrqrrqbb
rrqrqbbbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsp27srr7rrr7rrrrrrrrrrrrrrrnrrrrnrqrqbbb
rqbbqbkbrrrrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrrrs227srr7rrq7rrrrrrrrrrrrrrnrrrrrnqbbqbkb
rqbbrrkkrrrrrrrrqrbrrrrrqrbrrrrrrrrrrrrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrbrrrrrsus7srr7qrb7rrrrrrrrrrrrkkrrrrrrrnbbrrkk
qbbbbrrrrrrrrrrrbrrrrrrrbrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrsu777u777r777rrrrrrrrrrkkkkkrrrrqnbbbrrr
qbbbbrqrrrrrrrrrqrrbrrrrqrrbrrrrrrrrrrrrqrrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrbrrrskuurrrrrqrrbrrrrrrrrrrr2kkkkkkrrnbbbbrqr
rrkrrrqrrrrrrrrrrrrqrrrrrrrqrrrrrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrqrrrkrrkkrrrrrrrqrrrrrrrrrrk22kkkkkkkurkrrrqr
rkkrrqrbrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrkk22kkkkkkukkrrqrb
rrqrrqbbqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrqrqrbrqrkkkppkkkkkurbrqrqr
rrqrqbbbrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrqrrbbbrrkkkpp92222ubbbrrqr
rqbbqbkbrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbbqrbkbrbkkkk99kkkkubkbrbbq
rqbbrrkkrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbbqrkkrrbkkkkkkkkkurkkrrbbq
qbbbbrrrqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbbqrqrbbbkkkkkkkkuqrqrbbbb
qbbbbrqrrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrrbrbbbbrkkkkkubrrbrbbbb
rrkrrrqrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkrrbbqrrkr
rkkrrqrbqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkkqrkkrqkk

__gff__
0000000000000000010101010101000001000000000000000101010101010000010100010001010101010100000001000101010100010101010101000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000000101010101010000000000000000000000000000000000000000000000000000
__map__
03140314350026040303030303030303000000000000000000000000000000006464646464646464646464646464646400760000000000007800000000007600bebebebebebebebebebebebebebebebebebebebebe61bebebebebebebebebebd2b17171717173360171717171717172b17171717171717171717171717171717
14030403330000310303030303030303000000000000000000000000000000006464646464646464646464646464646400000077007600000000000077000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebebebebe74bcbebdbdbdbdbdbdbdbd2b14030314143324141414031414033b3b04031403030403030303030414033b
00000000000000000000000000000000000000000000000000000000000000006464646464646464646464646464646400000000000000000076000000007600bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebebebebe69bcbcbcbcbcc1c1bdbdbd2b14031403032c2d131413141414143b3b14030303030314030303030303033b
00000000000000000000000000000000000000000000000000000000000000006464646464646464646464646464646400007600000076000000000000000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebebebebe74bcbcbcc0bcbcbcbebdbd2b14141403033c3d041413141314033b3b03030303140303031403031403033b
00000000000000007c7c7c7c00000000000000000000000000000000000000006464646464646464646464646464646400000000000000000000007600000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebebebc2569bebcbcc0bcbcbcbebdbd2b14031414250060292926131413143b3b14030303031403030303031403143b
0000000000007c6f7a7a7a7a7f7c0000000000000000000000000000000000006464646464646464646464646464646400760000007600770000770000007600bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebcbcbc7474bebcbcbcbcbcbcbcbebd2b14141414350000007431141314043b3b04031403030303030303030303033b
0000000000797a7a7a7a7a7a7a7a7b00000000000000000000000000000000006464646464646464646464646464646400000077000000000000000000000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc2c2dbcbcbcbcbcbc94bcbcbd2b1414141433600000602814141314141303140303030303031403030303043b
0000000000797a7e7a7a7a7a7e7a7b00000000000000000000000000000000006464646464646464646464646464646400000000000000007600007600000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc3c3dbcbcbcbcbc94a394bcbd2b1414141433000000003814141413141413030303030303030303030314033b
0000000000797a7a7a7a7a7a7a7a7b00000000000000000000000000000000006464646464646464646464646464646400000076000000000000000000007700bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc3769bcbcbcbcbcbc94bcbcbd2b14031414377400603814140314143b3b04031403140314031403030303033b
0000000000797a7e7a7a7a7a7e7a7b00000000000000000000000000000000006464646464646464646464646464646400000000000077000000000000000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbe72bcbcbcbcbcbcbcbcbcbd2b14141414042300381414141403033b3b03030303030303030303140314033b
0000000000797a7a7e7e7e7e7a7a7b00000000000000000000000000000000006464646464646464646464646464646400760000760000000000007800000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc60bebebcbcbcbcbcbebebd2b14141414142700261414140314143b3b14140303140314030303030303033b
0000000000007d7d7d7d7d7d7d7d0000000000000000000000000000000000006464646464646464646464646464646400000000000000007600000000007600bdbcbcbcbcbcbcbcbcbcbcbcbcbcbcbebebebcbcbe74bdbdbebcbcbcbebdbdbd2b252e2680813500361414141414143b3b04807a81030303031403030303033b
00000000000000000000000000000000000000000000000000000000000000006464646464646464646464646464646400007700000000000000000000000000bdbcbcbcbcbcbcbcbcbcbcbcbcbcbebdbdbdbebebe69bd252929292e74bebebe25602e607d320000602614141414143b3b25323232260403030303031403143b
00000000000000000000000000000000000000000000000000000000000000006464646464646464646464646464646400000076000076000000760000000076bdbdbcbc252a2929292a2a26bc25292931bdbdbdbd6074746069602e7474296960002e2e2e0000000000292a292a2a313b35000000360314140303140303043b
000000000000000000000000000000000000000000000000000000000000000064646464646464646464646464646464000000000000000000000000770000002a2a2a2a00000000000000002a0000697531bd3529747461002e2e2e60697400000000000000000000000000006000002974000000602603041403030314033b
0000000000000000000000000000000000000000000000000000000000000000646464646464646464646464646464640000760000000076007600000000000000000000000000000000000000000000006069757500690000000000000000000000000000000000000000000000000000000000000060171717171404171717
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000760000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000171717171414171717
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007600770000000000007600000085a4a4a485a4a4a485b400000000000000000000000000000000000000000000000000000000000000000000000000000000000000007426141413131314143b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077000000007700a4b6b6b6b6b6b6b6b7a4a4b40000000000000000000000000000000000000000000000000000000000000000000000000000000000006028131314131313143b
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770000007700000000000000000085a5a5a5a5a5a5b6b7b7b7a485b4000000000000000000000000000000000000000000000000000000000000000000000000000000740038131413131313133b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007700000000a4a5a5a5a5a5a5a5a5b7b7b7b7a4a4b400000000000000000000000000000000000000000000000000000000000000000000000060003813131413131413143b
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077000000770076000076000000770085a5a5a5a5a5a5a5a5a5b7b7b7b7b7a4a4b40000000000000000000000000000000000000000000000000000000000000000606074281414131313131313133b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076000000000000000000000000a4a5a5a5a5a5a5a5a5a5a5a5a5b7b7b7b785a4b40000000000000000000000003710101010101010101010101010103a3974393900602613141313141314133b
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770000770000000085a5a5a5a5a5a5a5a5a5a5a5a5a5a5b7b7b7b7a4a485b40000000000b5a4a4b33bb07a7a7a7a7a7a7a7a7a7a7a7ab13b3b13131337606091261414131313133b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077000000000000000000007600a4a5a5a5a5a7aaaaa6a5a5a5a5a5a5a5b7b7b7b7b7b7a4a4a4a4a4a485b7b7b33b14131413030314141403031413143b3b1413141337a0a1607429261313143b
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007600000000000000000085a5a5a5a5aaaaaaaaa5a5a5a5a5a5a5b7b7b7b7b7b7b7b7b7b7b7b7b7b7b7953b13131314141314030303140303033b3b13131314131313376074602a297071
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770000770000000000007600000000a4a5a5a5a5aaaaaaaaa5a5a5a5a5b7b7b7b7b7b7b7b7b7b7b7b7b7b7b7b7b6a7949494949494949494949494949494940314131313141314131337393a607461
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770000000000770085a5a5a5a5a9aaaaa8a5a5a5a5a5b7b7b7b7b7a5a5a5a5a5a5b6b6b6a5a5b6a9949494949494949494949494949494941404141313131313131413131413133b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007600000000000000000000000000a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a597babaaababa96a5b23b13131314130413131314131313133b3b13131314130413131314131313133b
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007700007700000077000000007785a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a59860617499a5bababa04bababaa5b33b14131313131413141313131414143b3b14131313131413141313131414143b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000076000000a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5b4746061b5a5a9aaaaaaaaaaa8a5b33b13141413141313131314131413133b3b13141413141313131314131413133b
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007700000000770077000000000000a485a485a485a485a485a485a485a4b3b285858595a4a4b3b2a4b395b3b3a4b33b1717171717171717171717171717173b171717171717171717171717171717
__sfx__
901400100c05018000180301805023600110501f6001d0301d050006000c05018000240300c0501c600236001f6001c600216001f6001d60024600216001d600246001f6001f600236001d6001f600216001d600
491400100000010050000000000010050000000000010050000000000010050000000000010050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a31400100c5320c5320c5220c5220c5120c5120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a114001011034110341103411034150341503415034150340e0340e0340e0340e0341003410034000340003400034000300003000030000000000000000000000000000000000000000000000000000000000000
011400100c63500635000000000013635000050000000000000000000000000000000c63500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
091400100075500705007550075501705007550770502705007550270500755007550470504705007050070500705007050070500202000020000200002000020000200002000020000200000000000000000000
d31400100c05500055000000000013055000050000000000000000000000000000000c05500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a11400200e055100450e0351002513000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e010100100e0201002000000000000000000000
992300100c05413054100540e0540c00415004110040e0040c05415054110540e0540e00000004000040000400004140001200012000160001300016000130001700016000000000000000000000000000000000
9123001010000100001000010000130511303113021130210e001150010c0010c0011004110031100211c011000011a0011c0011f0011d0000000000000000000000000000000000000000000000000000000000
9123001000000000000000000000000000c0000e650000000e620006000c610000000000000000116500000011620006001061000000000000000000000000000000000000000000000000000000000000000000
0123001018025130001c0550e0000c00415004110040e0040c00015025110000e0550e00000004000040000400004000041a0001c0001f0001d00000000000000000000000000000000000000000000000000000
__music__
03 00010244
03 04034544
03 05060708
03 090a0b44

