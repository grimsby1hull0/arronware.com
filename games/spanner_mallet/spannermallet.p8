pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
	
	function map_collision( tile_x, tile_y, flag)
		-- get spr pos from map
		local sprite=mget(tile_x+level_x, tile_y+level_y)
		
		-- get flags of sprite pos
--		local tile_flag=fget(sprite)

		return fget(sprite, flag)
		
		-- compare with targets
--		if tile_flag == 0 then
--		 return 0
--		elseif tile_flag == 1 then
--			return 1
--		else		return nil


		
	end
	
	-- page vars
	page=1
	
	pg1_play=false
	pg1_chosen=false
	propsfx=false
	rip_play=false
	page4_music=false
	page5_music=false
	win_music=false
	
	
	-- spanner menu
	span_sel=false
	 
	menu_span={
	
		spr_=5,
		
		x=48,
	
	}
	
	
	-- mallet menu 
	mall_sel=false
	
	menu_mall={
	
		spr_=7,
		
		x=64,
	
	}
	
	
	
	-- animation frame clock
	frame=0
	
	
	
	
	-- clouds
	
	cloud = {
	
		x1=0,
		
		x2=0,
	
	}
	
	
	
	
	
	
	-- page 2
	
	
	-- start game if x is pressed
	--(control instruction)
	startgame=false
	
	-- contains player name 
	-- for collision physics
	-- !!! reset to nil
	player=nil
	
	spanner= {
		spr_=0,
		
		x=20,
		y=60,
		
		dy=0,
		
		up=0,
		
		down=0,
		
		
	}
	
	
	mallet= {
		spr_=0,
		
		x=20,
		y=60,
		
		dy=0,
		
		up=0,
		
		down=0,
		
		
	}
	
	
	cam_bg=0
	grass=64
	collided=0
	
	-- level xy collision offsets
	level_x=0
	level_y=0
	
	died=false
	





end
-->8
function _draw()
	cls(12)
	

	
	
	if page==1 then
		
		if not pg1_play then
			sfx(-1)
			music(-1)
			sfx(0)
			pg1_play=true
		end
		
		
		if (span_sel or mall_sel) 
		and not pg1_chosen then
			sfx(-1)
			sfx(2)
			pg1_chosen=true
		end
		
		if span_sel then
			menu_span.x-=1.5
		end
		
		if mall_sel then
			menu_mall.x+=1.5
		end
		
		
		
		-- animate menu mallet
		frame+=1
		if page==1 then
			if frame % 90 == 0 then
				menu_mall.spr_ = (menu_mall.spr_==7) and 39 or 7
			end
		end
	
	
	
		--print beach
		map(56, 2, 0, -40)
		
	
		-- upper
		print(".......", 25, 34, 7)
	 -- lower
		print(".......", 25, 42, 7)
		print("spanner", 25, 40, 6)
		
		print("&", 63, 40, 8)
		
		-- upper
		print("______", 76, 34, 7)
		-- lower
		print("______", 76, 42, 7)
		print("mallet", 76, 40, 4)
		--blue rect bg
		rectfill(10, 80, 110, 120, 12)
		map(0, 0, 0, 0)
		
		-- spanner
		spr(menu_span.spr_,menu_span.x, 56, 2, 2)
		
		-- mallet
		spr(menu_mall.spr_,menu_mall.x, 56, 2, 2)
		
		
		-- choose your side
		print("choose your side", 32, 109, 8)
		print("choose your side", 32, 111, 7)
		print("choose your side", 32, 110, 8)
		
		if not span_sel then
			print("❎", 44, 95, 7)
		end
		
		print("❎", 45, 95, 9)
		
		if not mall_sel then
			print("🅾️", 76, 95, 7)
		end
		
		print("🅾️", 75, 95, 14)
		

		

		
	end
	
	
	
	
	
	
	
	
	
	
	
	
	if page==2 and not died then
	
	
	
	
	
	
	-- animate planes
		frame+=1
		if page==2 then
			if span_sel and frame % 10 == 0 then
				spanner.spr_ = (spanner.spr_==1) and 3 or 1
			end
			
			if mall_sel and frame % 10 == 0 then
				mallet.spr_ = (mallet.spr_==17) and 19 or 17
			end
			
		end
			
			
			
			
			
	-- animate camera movement
		if page==2 and startgame then
			if frame % 1 == 0 then
				if cam_bg<=860 then
  					cam_bg+=0.5

					if span_sel then
  						spanner.x+=0.5
					end
					
					if mall_sel then
					 mallet.x+=0.5
					end

				end
			end
		
		end
		
		
		
		
		
		if not propsfx then
--			sfx(1)
   music(01)
			propsfx=true
		end
		
		
		cls(12)
		
		camera(cam_bg, 0)
		
		--moon
		spr(112, cam_bg+90, 20, 1, 1)
		
		map(56, 2, cam_bg, 0)
	
		map(0, 20, 0, 0, 127, 16)
		
		
		
		-- x to play
		if not startgame then
			print("chapter i:beach", 40, 30, 7)
			print("chapter i:beach", 40, 31, 9)

			if span_sel then
				spanner.x=20
				print("❎ to move", 60, 60, 7)
				print("❎ to move", 60, 61, 8)
			end
			if mall_sel then
				mallet.x=20
				print("🅾️ to move", 60, 60, 7)
				print("🅾️ to move", 60, 61, 8)
			end
		
		end
		
		
		
		
		
		if span_sel then
			spr(spanner.spr_, spanner.x, spanner.y, 2, 1)
--   print(spanner.dy, 60, 60, 7)
--			print(spanner.up, 60, 68, 7)
--			print(spanner.down, 60, 76, 7)
 	else
			spr(mallet.spr_, mallet.x, mallet.y, 2, 1)	
		end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	end
	














	
	if page==3 then

		camera(0, 0)
		if not rip_play then
			sfx(-1)
			music(-1)
			sfx(5, 0)
			rip_play=true
			
		end
	
		if span_sel then
			map(18, 1, 0, 0)
			rectfill(20, 14, 107, 60, 12)
			-- rip
			sspr(0, 40, 24, 12, 33, 30, 60, 24)
			
			-- welcome back sign
			sspr(24, 40, 32, 16, 31, 50, 64, 32)
			print("welcome back!", 40, 55, 14)
			-- crying mallet
			spr(89, 40, 70, 2, 2)
			
			
			-- white txt bg
			print("❎ or 🅾️", 49, 91, 7)
			
			print("to play again", 38, 101, 7)
			
			-- normal
			print("❎ or 🅾️", 49, 90, 9)
			
			print("to play again", 38, 100, 9)
		end
		
		if mall_sel then

			map(37, 1, 0, 0)
			rectfill(20, 14, 107, 60, 12)
			-- rip
			sspr(0, 40, 24, 12, 33, 30, 60, 24)
			
			-- welcome back sign
			sspr(24, 40, 32, 16, 31, 50, 64, 32)
			print("welcome back!", 40, 55, 14)
			-- crying spanner
			spr(87, 40, 70, 2, 2)
			
			
			-- white txt bg
			print("❎ or 🅾️", 49, 91, 7)
			
			print("to play again", 38, 101, 7)
			
			-- normal
			print("❎ or 🅾️", 49, 90, 14)
			
			print("to play again", 38, 100, 14)
		
		
		
		end
		
	
	end











	if page==4 then
	
	
		if not page4_music then
--			sfx(1)
			music(-1)
   music(02)
--   startgame=false
			page4_music=true
		end
		
		
		if not startgame then
			cam_bg=0
			if span_sel then
				spanner.x=20
				spanner.y=60
			end
			if mall_sel then
				mallet.x=20
				mallet.y=60
			end
		end
	
	-- animate planes
		frame+=1
		if page==4 then
			if span_sel and frame % 10 == 0 then
				spanner.spr_ = (spanner.spr_==1) and 3 or 1
			end
			
			if mall_sel and frame % 10 == 0 then
				mallet.spr_ = (mallet.spr_==17) and 19 or 17
			end
			
		end
			
			
			
			
			
	-- animate camera movement
		if page>=4 and startgame then
			if frame % 1 == 0 then
				player.x+=0.5
				if cam_bg<=860 then
					cam_bg+=0.5

					
					

				elseif cam_bg<=860 then
					cam_bg+=0
					

				end
			end
		
		end
		
		
		
		
		
		
		
		
		
		cls(1)
		
		camera(cam_bg, 0)
		
		--moon
		spr(113, cam_bg+90, 20, 1, 1)
		
		map(56, 2, cam_bg, 0)
	
		map(0, 39, 0, 0, 127, 16)
		
		
		
		-- x to play
		if not startgame then
			print("chapter ii:invasion", 20, 30, 7)
			print("chapter ii:invasion", 20, 31, 8)
			if span_sel then
				spanner.x=20
				print("❎ to move", 60, 60, 7)
				print("❎ to move", 60, 61, 8)
			end
			if mall_sel then
				mallet.x=20
				print("🅾️ to move", 60, 60, 7)
				print("🅾️ to move", 60, 61, 8)
			end
		
		end
		
		
		
		
		
		if span_sel then
			spr(spanner.spr_, spanner.x, spanner.y, 2, 1)
--   print(spanner.dy, 60, 60, 7)
--			print(spanner.up, 60, 68, 7)
--			print(spanner.down, 60, 76, 7)
 	else
			spr(mallet.spr_, mallet.x, mallet.y, 2, 1)	
		end
	
	




	end






	if page==5 then
	
	
		if not page5_music then
   sfx(-1)
			music(-1)
   sfx(11)
			page5_music=true
		end
		
		
		
		if not startgame then
			cam_bg=0
			
			player.x=20
			player.y=60
			
			
		end
	
	-- animate planes
		frame+=1
		if page==5 then
			if span_sel and frame % 10 == 0 then
				spanner.spr_ = (spanner.spr_==1) and 3 or 1
			end
			
			if mall_sel and frame % 10 == 0 then
				mallet.spr_ = (mallet.spr_==17) and 19 or 17
			end
			
		end
			
			
			
			
			
	-- animate camera movement
		if page>=4 and startgame then
			if frame % 1 == 0 then
				player.x+=0.5
				if cam_bg<=320 then
					cam_bg+=0.5

				end
			end
		
		end
		
		
		
		
		
		
		
		
		
		cls(12)
		
		camera(cam_bg, 0)
		
		--sun
		spr(112, cam_bg+90, 20, 1, 1)
		
		map(56, 2, cam_bg, 0)
	
		map(72, 0, 0, 0, 127, 16)
		
		
		
		-- x to play
		if not startgame then
			print("chapter iii:homerun", 40, 30, 7)
			print("chapter iii:homerun", 40, 31, 9)

			if span_sel then
				spanner.x=20
				print("❎ to move", 60, 60, 7)
				print("❎ to move", 60, 61, 8)
			end
			if mall_sel then
				mallet.x=20
				print("🅾️ to move", 60, 60, 7)
				print("🅾️ to move", 60, 61, 8)
			end
		
		end
		
		
		
		
		
		if span_sel then
			spr(spanner.spr_, spanner.x, spanner.y, 2, 1)
--   print(spanner.dy, 60, 60, 7)
--			print(spanner.up, 60, 68, 7)
--			print(spanner.down, 60, 76, 7)
 	else
			spr(mallet.spr_, mallet.x, mallet.y, 2, 1)	
		end
	
	




	end



	
	if page==6 then
		
		cam_bg=0
		level_x=0
		level_y=0
	
		if not win_music then
   sfx(-1)
			music(-1)
			music(3)

   win_music=true
			
		end
		
	
	-- animate planes
		frame+=1
		if page==5 then
			if span_sel and frame % 10 == 0 then
				spanner.spr_ = (spanner.spr_==1) and 3 or 1
			end
			
			if mall_sel and frame % 10 == 0 then
				mallet.spr_ = (mallet.spr_==17) and 19 or 17
			end
			
		end
		
		
		cls(12)
		
		camera(cam_bg, 0)
		
		--sun
		spr(112, cam_bg+90, 20, 1, 1)
		--beach
		map(56, 2, 0, 2)
		-- crashed plane
		spr(240, 42 , 94, 2, 1)
		--mallet pool
		spr(7, 71, 87, 2, 2)
		-- house etc
		map(47, 55, 0, 56, 16, 30)




		-- title
		
		-- upper
		print(".......", 25, 34, 7)
	 -- lower
		print(".......", 25, 42, 7)
		print("spanner", 25, 40, 6)
		
		print("&", 63, 40, 8)
		
		-- upper
		print("______", 76, 34, 7)
		-- lower
		print("______", 76, 42, 7)
		print("mallet", 76, 40, 4)
		
		-- thanks for playing
		print("thanks", 25, 50, 8)
		print("for", 44, 56, 9)
		print("playing!", 49, 62, 14)
		-- white bg
		print("thanks", 26, 50, 7)
		print("for", 45, 56, 7)
		print("playing!", 50, 62, 7)
		
		-- button
		print("⬆️ to return", 12, 72, 7)

		
		
		
		
		

	
	




	end









end
-->8
function _update60()

	-- page 1
	if page==1 and not (span_sel or mall_sel) then
		--spanner
		if btnp(5) then
			span_sel=true
			player=spanner
		
		
		end
		
		-- mallet 
		if btnp(4) then
			mall_sel=true
			player=mallet
		
		
		end

	
	end

	if page==1 and (menu_span.x<=-4 or menu_mall.x>=115) then
		page=2

		
	end



	if page==6 and btnp(2) then
		_init()
	end






-- page 2, 3 (death) & 4
	

	if (page==2 or page==4 or page==5) and not died then
		if page==2 then
		 level_y=20
		elseif page==4 then
		 level_y=39
		elseif page==5 then
		 level_y=0
		 level_x=72
		elseif page==3 then
		 level_y=0
		end

		-- collision
			-- died
			if 
			--bottom left
			map_collision(player.x\8, player.y\8, 0) 
			--bottom right
			or map_collision((player.x+13)\8, player.y\8, 0)
			--top left
			or map_collision(player.x\8, (player.y +6 )\8, 0) 
			--top right
			or map_collision((player.x+15)\8, (player.y +6 )\8, 0)
			then
				died=true
				page=3
				level_x=0
				level_y=0
				player.dy=0
				player.down=0
				
			
			end
			
			
			-- if collide with finish
			if 
			--bottom left
			map_collision(player.x\8, player.y\8, 1) 
			--bottom right
			or map_collision((player.x+15)\8, player.y\8, 1)
			--top left
			or map_collision(player.x\8, (player.y +7 )\8, 1) 
			--top right
			or map_collision((player.x+15)\8, (player.y +7 )\8, 1)
			then
			-- next level
				startgame=false
				if page==2 then
					page=4
				else
					page+=1
				end
				
				
				
				
			end
		
		
		--x to start
		if not startgame and (btnp(5) or btnp(4)) then
			if span_sel then
				spanner.y=60
			end
			if mall_sel then
				spanner.y=60
			end
			
			
			
			startgame=true
			
		end
		
		-- spanner physics
		if span_sel and startgame and not died then
			-- gravity
			spanner.y+=0.5
			spanner.y-=spanner.dy
			if btn(5) then
				if spanner.dy<=1.25 then
--					spanner.y-=3
					spanner.dy+=0.04
--					spanner.up=0
					spanner.down=0
					
					else
--					sfx(3)
			
					
				end
				
			end
			
			if not btn(5) then 
				if spanner.dy>0.05 then
					spanner.dy-=spanner.down
				end
				spanner.down+=0.015
--				spanner.y+=spanner.acc
			end
			
			
			
			
			
			
			
			
			
			-- hit floor
			if spanner.y>= 114 then 
			-- die
			-- no escape
			spanner.y=5000
			page=3
			
			end
			
			-- hit roof
			if spanner.y<= 0 then 
			-- stop
			spanner.y=0
			
			end
			
			
			
			
			
			
			
			
			
			
				
			
			
			
			
			
			
		end
		
		
		-- mallet physics
		if mall_sel and startgame then
			-- gravity
			mallet.y+=0.5
			mallet.y-=mallet.dy
			if btn(4) then
				if mallet.dy<=1.25 then
--					spanner.y-=3
					mallet.dy+=0.04
--					spanner.up=0
					mallet.down=0
					
					else
--					sfx(3)
			
					
				end
				
			end
			
			if not btn(4) then 
				if mallet.dy>0.05 then
					mallet.dy-=mallet.down
				end
				mallet.down+=0.015
--				spanner.y+=spanner.acc
			end
			
			
			
			
			
			
			
			
			
			-- hit floor
			if mallet.y>= 114 then 
			-- die
			-- no escape
			mallet.y=5000
			page=3
			
			end
			
			-- hit roof
			if mallet.y<= 0 then 
			-- stop
			mallet.y=0
			
			end
			
		end

	end
	
	if page==3 and (btnp(4) or btnp(5)) then
		_init()
	end












end
__gfx__
00000000000000001110000000000000111000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb
00000000000000016cc17000000000016c7100700000606060600000000000000000000000d00d0d00d00d000000000000000000bbbb3bbbbbb3bbbbbbb3bbb0
000000000770001cfcc150000770001cfcc505000000606060600000000000fffff0000000d00d0d00d00d000000000000000000bbbbb3bbbbbb3bbbbbbb3bb0
00000000077700889975d570077700889988d000000060fff060000000000fffffff000000d00d0d00d00d00000dd66666677000bbbbb3bbbbbb3bbbbbbb3b00
000000000088888888885000008888888885850000006fffff60000000000d7fffd7000000d00d0d00d00d00000dd66666677000bbbbbbbbb3bbbbbbb3bbb000
000000000088288811887000008828881178807000000f7d7d00000000000ff2f2ff000000d0666667670d000dd6666666666770bb3bbbbb3bbbbbbb3bb00000
000000000008888888800000000888888880000000000fffff0060600000022fff22000000d6666666667d000dd6666666666770bbb3bbbb3bbbbbbb3b000000
00000000000002880000000000000288000000000000000f0000666004440200f002000000066615561550000555566666655550bbb3bbbbbbbbbbbbb0000000
0000000000000000111000000000000011100000009999f6f999060004440ee222ee0000000d6611561150000555566666655550bbb3bbbbbbbbbb3bbbbbbbbb
0000000000000001fcc1700000000001fc7100700090096f69090f0000400ee2f2ee0000000d6666666660000666622662266660bbbbbbbbbbbbb3bb0bbb3bbb
000000000770001cf4c150000770001cf4c50500009ff9969909ff0000ffeeeefeee0000000ddddd666660000666622662266660bbbbbb3bbbbbb3bb0bb3bbbb
e00000e5077700889475d570077700889488d0000000f99999006060004000eeeeef000000000000000000000222266666622220bbbbb3bbb3bbb3bb00b3bbbb
0eeeee00008888884888500000888884488585000000f99999000600000000eeeeeff00000000000000000000222266666622220b3bbb3bbbb3bbbbb000bbb3b
e00ee000008828841188700000882888117880700000099999000000000000eeeee0000000000000000000000220000000000220bb3bbbbbbb3bbbbb00000bb3
00ee0000000888888880000000088888888000000056090009065000000550700070550000000000000000000220000000000220bb3bbbbbbb3bbbbb000000b3
00000000000002880000000000000288000000000005650005650000000555500055550000000000000000000000000000000000bbbbbbbbbbbbbbbb0000000b
9a9999a99a9999a90000000d2eeeeeeeeeeeeeeeeeeeee00eeeeeeee0000000000000000000000000000000000000000ffffffff00000000000000000000000b
aaaaaaa22aaaaaaa00000ddd22eeeeeeeeeeeeeeeee55ee0eeeeeeee00000000000000000000000000000016000000c6ffffffff0000000000000000000000b3
999a99244299a9990000dddde2eeeeee0eeeeeeee55bbee0eeeeeeee000000fffff0000000000000011111110cccccccfaffffaf000000000000000000000bb3
aaaaa224422aaaaa000ddddde22eeeee00eeeeeeeeb3bbe0eeeeeeee00000fffffff00000000000011661161cc66cc6cffffffff0000000000000000000bbb3b
9a992422224299a900dddd5dee22eeee000eeeeeeeb3bbe0eeeeeeee000007dfff7d0000000000006611661166cc66ccffffafff000000000000000000b3bbbb
aaa4424224244aaa005555ddeee222ee0000eeeeebb3bbe0eeeeeeee00000ff2f2ff00000000000011111111ccccccccffffffaf00077700000000000bb3bbbb
9942222442222499000dddddeeeee2220000eeeeebbbbeeeeeeeeeee0000022fff2200000000000066616666666c6666faffffff00777707777700000bbb3bbb
a42244244244224a00000000eeeeeeee000000eeeeeeeeeeeeeeeeee04440200f00200000000000011161111ccc6ccccffffafff0777777777770000bbbbbbbb
0000000040000000eeeeeeee00778800000bb000000bb0000000000004440ee222ee000000000000cc70007000070ccc000000000777777777777000b0000000
0000000004000000eeeeeee20777788000bbbb0bb0bbbb007777777700400ee2f2ee00000770000cccc505000005ccccc000077007777777777770003b000000
0000000000404d00eeeeee208777788800b1b10bb01b1b007877787700ffeeeefeee000007770088cc88d000075d57cc8800777006677777777777003bb00000
0000000000040000eeee220088878888b0b1b10bb01b1b0b77878777004000eeeeef0000008888888885850000058888888888000006667777777000b3bbb000
0000000000404000eee2000088887888b02bbb0bb0bbb20b77787777000000eeeeeff000008828881178807000078811888288000000006666666000bbbb3b00
0000000000d00d00e220000088877778bbb22bbbbbb22bbb77878777000000eeeee00000000888888880000000000888888880000000000000000000bbbb3bb0
0000000000000000000000000887777000bbbb0000bbbb00787778770005507000705500000052880050000000000500882500000000000000000000bbb3bbb0
000000000000000000000000008877000030030000300300777777770005555000555500000550000055000000005500000550000000000000000000bbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb99a99a9999a99a9944dddd240000000000000000000000001177000000000000
bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbbbbbbbbbb30aaaaaaaaaaaaaa02d3333d20700000000220000000000000157000000000000
bb3bbb3bb3bbb3bb3bbb3bbbbbb3bbb3bb3bbb3bb3bbb3bb3bbb3bbbbbb3bbb30099a99aa99a9900d3333b3d0170060002d220040aa0000000e0055500077600
bbb3bbbbbb3bbbbbb3bbbbbb3bbbbbbbbbbbbbb3bbbbbb3bbbbbb3bbbbbb3bbb000aaaaaaaaaa000dbb3b3bd97706707992222240daa00a9000eee6007766000
bbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbbbbbbbbbb3bbbbbb3b000099a99a990000d33b333d906777779002442199aaaa9a00eee60079777777
bbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbbbbbbbbbb3bbbbbb3bbbbbb3bb00000aaaaaa00000d333333d00067660000014400aa9aaaa05ee67000d970040
b3bbbbbb3bbbbbbbbbbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbb00000099990000004d3333d20000670000000044000a990005e6007000767700
bb3bbbbbb3bbbbbb3bbbbbbbbbbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbbbb3bbbb0000000aa000000042dddd440000000000000000000000000550000700006660
9000900090900900a00900094555500055500055000555000005550400000000000000000000000000000080a00000000000000a040440207777777777777777
02928900092928009022289047777555777555775557775555577754000006000600000000000000000000809900000000000099004442007777777775e77777
02002800000280000920a280477777777777777777777777777777740060006060006000000000fffff00000aaa0000000000aaa000420007666666777e77777
0200280000028000002a928047777777777777777777777777777774060600fff006060000000fffffff00809a990000000099a9000420007662666777eeeee7
0202800000028000002228004777777777777777777777777777777400006fffff600000000007dfff7d0000aaaaa000000aaaaa000420007662666777eeee77
02002800000280000028800047777777777777777777777777777774000007dfd700000000000cf6f6ff0000a99a99000099a99a004442007cccccc7777ee477
0200028000028000002800004555777755577755577755555777555400000fffcf0000000000066fff660000aaaaaaa00aaaaaaa04044020777cc77777747747
b2bbb28bbb2228bbbb28bbbb400055550005550005550000055500040000009f9000000000000600f006000099a99a9999a99a99044004207777777777477777
bbbbbabb9babbbbbbababbbb40000000000000000000000000000004000009969900000000000ee666ee000044224424aa99aa9a044004406666666677777777
333ba9333893ab33b9a333a3400000000000000000000000000000040000996f6990000000000ee6f6ee00002242222499a9999a777777776664466677c77770
3b3398bbb38b398b389bb8b0400000000000000000000000000000040000099699000000000000eefee0000042444242a9aaa9a977778777666444667ece7700
0bbbb88b000bb8bbb8bb8000400000000000000000000000000000040000099999000000000000eeeee0000042222422a9999a9977777877664444667ece7000
0000bb800000000bbb000000400000000000000000000000000000040000099999000000000000eeeee000002242222499a9999a78888787664444667ece7700
000000000000000000000000400000000000000000000000000000040000099999000000000000eeeee00000242444249a9aaa9a77777877664444667ccc7770
000000000000000000000000440000000000000000000000000000440056090009065000000550700070550042222422a9999a99777787776644456674447777
000000000000000000000000404000000000000000000000000004040005650005650000000555500055550042442244a9aa99aa667777666644446677777777
a000a00a00aaa900000000047887788700e000004429442444224424000333300333300000000004200000000000000424242424400000006666666677777777
0a9a99a00000a99000000022878888780000000029a9992a224222240033bbb33bbb330000000002400000000000004242444244240000006666666607777c77
09aaaa900000aaaa000004448878878800000e00a9a8a9a24200004203bbbb3bb3bbbb3000000004240000000000055444444444455000006665d6660077ece7
a9aaaa9a00000aaa000022427887788700e00000499a8a9a40a00a2233bbbb3bb3bbbb33000000044400000000002424424242424242000066599d660007ece7
0aaaaaa0000009aa00044444878888780000000029a44994200000043bbbb33bb33bbbb30000000442000000000554424424442424455000665995660077ece7
09aaaa9000000aa9002242248878878800000e002a944a24240000043bb3303bb3033bb30000000424000000004424444444444444424400666556660777ccc7
0a99a9a00000aaa0044444447887788700e0000049949a22420000220334003bb304433000000042400000000554424424242424442445506666666677774447
a00a000a00a99a00224224228788887800000000424999a442442244004400433004400000000024400000004424244442444244444242446666666677777777
0000000000000000000000c5c6c6c6c6c6c6c6c6c6b5000000000000e7e7e70000000000d600d500d5000000000000000097a7778797a7000000000000000000
000000000000000000f5b2b2a2a2f5f60000000000000000a2b2b247000000000000000000000000000000000000000000000000000000f2d0d0d0d0d0d0d0d0
00000000000000000000c5c6c6c6c6c6c6c6c6c6c6c6b50000000000e7e7e70000000000d500d500d5000000000000006397a797a797a7000000000000b7c7d7
000000000000000000f7e5e5e5e5e5e50000d60000000000b2b2b247000000430000000053000000003545556535455565354555650000d0d0d0d0d0d0d0d0d0
000000000000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c6b500000000e7e6e70000000000d500d500d500000000000000d597a797a797a7000000c5b500f7e6f6
000000000000000000f7e5e6e5e5e5f60000d50000000000b2b2b2470000000000000000000000000036465666364656663646566600f2d0d0d0d0d0d0d0d0d0
04142434445464740414243444546474041424344454647404142434445464740414243444546474041424344454640414243444546474041424344454647404
14243444546474041424344454647404142434445464740414243444546474041424344454647404373737373737373737373737373774041424344454647404
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004747
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004747
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e70000000000000000000000
000000000000000000000000000000000000000000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6b50000000000000000000000000000004747
00000000000000000000000000000000000000000097a700000000000000000000000000000000f4000000000000000000000000e70000000000000000000000
0000000000000000000000000000000000000000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6b500000000000000000000000000004747
00000000000000000000000000000000000000000097a70000000000000000000000000000d40000000000000000000000000000e70000000000000000000000
00002252530000000000000000000000000000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6b5000000000000000000000000004747
00000000000000000000000000000000000000000077870000000000000000000000f40000000000000000000000000000000000e75300000000000000000000
000000423262230000000000000000000000000000c5c6c6c6c6c602b6b6b6b6b612c6c6c6c6c6c6c6c6c6c6c6c602b6b6d70000000000000000000000004747
00000000000000000000000000000000000000000000000000000000000000d400000000000000f40000000000000000000000e7e7e700000000000000000000
0000000013130000000000000000000000000000c5c6c6c6c602b6b6b6b6b6b6b6b612c6c6c6c6c6c6c6c6c6c602b6b6b6b6d700000000000000000000004747
000000000000000000000000000000000000000000000000000000000000000000f6000000b794000000000000000000000000e7e7e700000000000000000000
00000000000000000000000000000000000000c5c6c6c602b6b6b6b6b6b6b6b6b6b6b612c6c6c6c6c6c6c6c602b6b6b6b6b6b6d7000000000000000000004747
0000000000000000000000000000000000000000000000000000000000000000c5f5b2b2b2f600000000000000000000000043e7e7e700000000000000000000
000000000000000000000000000000000000b7b6b667b6b6b6b657b6b6b6b6b657b6b6b6c6c6c6c6c6c6c6c6b6b6b6b657b6b6b6d70000000000000000004747
00000000000000000000000000000000000000000000000000330000000000000084e5e5e59400e400000000000000000000e7e7e7e7e7000053000000000000
0000000000000000000000000000000000b7b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b612c6c6c6c6c6c602b6b6b6b6b6b6b6b68fb500000000000000004747
0000000000000000000000000000000000000090a0000000c5d6000000000000b40000840000000000000000000000000000e7e7e7e7e7b2b2e7940000000000
00000000000000000000000000000000b7b6b6b657b6b6b6b6b6b6b6b6b6b6b6b6b667b6b6c6c6c6c6c6c6b6b6b6b6b6b6b6b68fc6c6b5000000000000004747
00000000000000000000000000000000000000e7e70053f2f0000000000000000000e40000b4000000000000000000000000e7e7e6e7e7e7e794000000000000
002252000000000000000000000000b7b6b6b6b6b6b6b6b68fc6c6c6c6c62fb6b6b6b6b6b612c6c6c6c6c6b6b6b6b6b6b68fc6c6c6c6c6b50000000000004747
00000000000000000000000000000000000000f1f0f2d0f00000000000000000000000000000000000000000000000000000d500d500d5000000000000000000
0000625300000000000000000000c5c6c6c62fb6b6b6b68fc6c6c6c6c6c6c6b6b6b6b6b6b6b6c6c6c6c602b6b657b6b68fc6c6c6c6c6c6c6b500000000004747
000000000000000000000000000000000053f2d0e0f000000000000000000000000000000000000000007787000000000000d500d500d5000000000000000000
00006262620000000000000000c5c6c6c6c6c6c6c6c6c6c6c6c602b612c6c62fb6b6b6b6b6b612c6c602b6b6b6b6b6b6c6c6c6c6c6c6c6c6c6b5000000004747
00000000000000000000000000000000f2e0f0d1e100000000000000000000000000000000000000000097a7000000000000d500d500d5000000000000000000
000042326223000000000000c5c6c6c6c6c6c6c6c6c6c6c6c602b6b6b612c6c6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b68fc6c6c6c6c6c6c6c6c6c6b50000004747
000000000000000000000000000000c5f00000d1e100000000000000000000000000000000000000000097a7000000000000d600d500d6000000000000000000
0000006200000000000000c5c6c6c6c6c6c6c6c6c6c6c6c657b6a467a45737c62fb6b6b6b657b6b6b6b6b6b6b6b68fc6c6c6c6c6c6c6c6c6c6c6c6b500004747
000000000000000000000000000000d60000f2f0f1f3000000000000000000000000000000000000000097a7000000000000d500d500d5000000000000000000
000000d5000000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c637b6b6b6b63737c6c6b6b6b6b6b6b6b6b6b6b6b6b68fc6c6c6c6c6c6c6c6c6c6c6c6c6c6b5004747
0000000000000000000000000000000000c5f00000f1b50000000000000000000000000000000000000097a7000000000000d500d500d5000000000000000000
000000d50000000000c5c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c62fb6b6b6b6b6b6b6b6b6b68fc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6b54747
041424344454647404142434445464740414a2a2a2a2647404142434445464740414243444546474041424344454640414243444546474041424344454647404
243444546474041424c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c647
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
62666526677777766eeeee26000d0004242424240000030000000000244424443333333300000000000000000000000000000000000000000000007f00000000
5266552657c7cc765eecee2600d0004242477244000003000000000044424a423833333300000033330000000000000000000000000000000000000000000000
222222222777cc722eccce220d0d0554447cc744080033300033c0004344aea433333333000033333333000000000000000000000000000000003e4ed7000000
6652666567c7cc756eecee250dd0242447cccc72898033300c3ccc0039344a443333338303333383333333300000000000000000000000000000000000000000
6552655567c7cc756e2eee250d05544247cccc740800020003ccc5004344424233333333333333333333338300003000000000000000000000000e7e0e000000
2222222227c7cc722eeeee220d442444447cc74442b3b2b48333333a52b3b2b53333333333333333333333330003300000000000000000000000000000000000
65265265677777756eddde25055442442427742444444444356335635555555533383333333833333333333300383300000000000000000000002e1e0e3f0000
55255255552552555eeeee2544242444424442440044440006500650425555423333333333333333383333330333333000000000000000000000000000000000
0b30000011700030a42244244000d000442424444442424444224424000000004244224a33333333333333330000000000000000009eae27a2a20e0e0e1e0000
07730001111305b09942222424000d00055442444424455022422224000000004222249933333338333383330000000000000000000000000000000000000000
077700881138d000aaa442424550d0d00044244444424400421111420000000024244aaa333333333333333300000000000050607f9faf0e1e0e1e0e0e5f0000
0088888888b585009a99242242420dd0000554422445500041a11a2200000000224299a938333333333333330000000000000000000000000000000000000000
0038288811788070aaaaa224244550d000002424424200002111111400000000422aaaaa0333333338333330000000005e005161a497a71e2e1e0e0ed56e0000
0308888888800000999a9924444244d0000005544550000024811814000244004299a99900003333333300000000000000000000000000000000000000000000
0300528800500000aaaaaaa244244550000000422400000042188122002445502aaaaaaa00000033330000000000000414243444546474041424344454645400
00035000005500009a9999a944424244000000044000000042442244044242449a9999a900000000000000000000000000000000000000000000000000000000
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccc7ccc7ccc7ccc7ccc7ccc7ccc7ccccccccccccccccccccccccc777c777c777c777c777c777ccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccc66c666c666c66cc66cc666c666ccccccccccc88ccccccccccc444c444c4ccc4ccc444c444ccccccccccccccccccccccccccccc
ccccccccccccccccccccccccc6ccc6c6c6c6c6c6c6c6c6ccc6c6ccccccccccc88ccccccccccc444c4c4c4ccc4ccc4cccc4cccccccccccccccccccccccccccccc
ccccccccccccccccccccccccc666c666c666c6c6c6c6c66cc66ccccccccccccc88cccccccccc4c4c444c4ccc4ccc44ccc4cccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccc6c6ccc6c6c6c6c6c6c6ccc6c6ccccccccccc8c8cccccccccc4c4c4c4c4ccc4ccc4cccc4cccccccccccccccccccccccccccccc
ccccccccccccccccccccccccc66cc6ccc6c6c6c6c6c6c666c6c6ccccccccccc888cccccccccc4c4c4c4c444c444c444cc4cccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccc7ccc7ccc7ccc7ccc7ccc7ccc7ccccccccccccccccccccccccc777c777c777c777c777c777ccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc6c6c6c6ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc6c6c6c6cccccccccccfffffccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc6cfffc6ccccccccccfffffffcccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc6fffff6ccccccccccd7fffd7cccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccf7d7dcccccccccccff2f2ffcccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccfffffcc6c6cccccc22fff22cccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccfcccc666cc444c2ccfcc2cccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccc7cccccccccccccc9999f6f999c6ccc444cee222eecccccccccccccc7ccc7ccccccccccccccccccccccccccccccccc
ccccccc6ccccccc6ccccccc6ccccccc6ccc5ccccccccc776cc9cc96f69c9cfc6cc4ccee2f2eeccc6c77cccccccc5c5c6ccccccc6ccccccc6ccccccc6ccccccc6
ccccccccccccccccccccccccccccccccc75d57cc88cc777ccc9ff99699c9ffccccffeeeefeeeccccc777cc88cc88dccccccccccccccccccccccccccccccccccc
cc66cc6ccc66cc6ccc66cc6ccc66cc6ccc6588888888886ccc66f99999666c6ccc46cceeeeefcc6ccc8888888885856ccc66cc6ccc66cc6ccc66cc6ccc66cc6c
66cc66cc66cc66cc66cc66cc66cc66cc66c78811888288cc66ccf99999cc66cc66cc66eeeeeff6cc668828881178867c66cc66cc66cc66cc66cc66cc66cc66cc
ccccccccccccccccccccccccccccccccccccc88888888cccccccc99999cccccccccccceeeeecccccccc88888888ccccccccccccccccccccccccccccccccccccc
666c6666666c6666666c6666666c6666666c656688256666665669666966566666655676667c5566666c5288665c6666666c6666666c6666666c6666666c6666
ccc6ccccccc6ccccccc6ccccccc6ccccccc655ccccc55cccccc565ccc565ccccccc5555ccc5555ccccc55ccccc55ccccccc6ccccccc6ccccccc6ccccccc6cccc
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
faffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaffaffffaf
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafff
ffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffaf
fafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffaffffff
ffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafffffffafff
bbbbbb3bbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3b
bbbbb3bbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bb
bbbbb3bbbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bb
b3bbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bbbbbbb3bbb3bbb3bb
bb3bbbbbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbbb3bbb3bbbb3bbbbb
bb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbb
bb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb3bbbbbbbb3bbbbbb3bbbbbbb3bbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbb3bbbbbbb3bbbbbb3bbbbbbbb3bbb
bbbb3bbbbbbbb3bbbbbb3bbbbbbb3bbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb3bbbbbbbbb3bbbbbb3bbbbbbbb3bb
bbbb3bbbbbbbb3bbbbbb3bbbbbbb3bccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccb3bbbbbbbbb3bbbbbb3bbbbbbbb3bb
b3bbbbbbbbbbbbbbb3bbbbbbb3bbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbb3bbbbbbbbbb3bbbbbbbbbbbbbb
3bbbbbbbbb3bbbbb3bbbbbbb3bbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb3bb3bbbbb3bbbbbbbbb3bbbbb
3bbbbbbbbbb3bbbb3bbbbbbb3bccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccb3bbb3bbbb3bbbbbbbbbb3bbbb
bbbbbbbbbbb3bbbbbbbbbbbbbcccccccccccccccccccc799999ccccccccccccccccccccccccceeeee7cccccccccccccccccccccbbbb3bbbbbbbbbbbbbbb3bbbb
bbbbbb3bbbb3bbbbbbbbbb3bcccccccccccccccccccc79979799cccccccccccccccccccccccee7ccee7cccccccccccccccccccccbbb3bbbbbbbbbb3bbbb3bbbb
bbbbb3bbbbbbbbbbbbbbb3bbcccccccccccccccccccc79997999cccccccccccccccccccccccee7e7ee7cccccccccccccccccccccbbbbbbbbbbbbb3bbbbbbbbbb
bbbbb3bbbbbbbb3bbbbbb3bbcccccccccccccccccccc79979799cccccccccccccccccccccccee7ccee7cccccccccccccccccccccbbbbbb3bbbbbb3bbbbbbbb3b
b3bbb3bbbbbbb3bbb3bbb3bbccccccccccccccccccccc799999ccccccccccccccccccccccccceeeee7ccccccccccccccccccccccbbbbb3bbb3bbb3bbbbbbb3bb
bb3bbbbbb3bbb3bbbb3bbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccb3bbb3bbbb3bbbbbb3bbb3bb
7000000000000bbbbb3bbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb3bbbbbbb3bbbbbbb3bbbbb
0700000000000bbbbb3bbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb3bbbbbbb3bbbbbbb3bbbbb
0070000000000bbbbbbbbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbbbbbbbb
0700000000000bbbbbbbbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbbbbbbbb
7000000000000bbbbbb3bbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbb3bbbbbb3bbbbbbbb3bbb
00000000000003bbbbbb3bbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbb3bbbbbb3bbbbbbbb3bb
bbbb3bbbbbbbb3bbbbbb3bbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbb3bbbbbb3bbbbbbbb3bb
b3bbbbbbbbbbbbbbb3bbbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbb3bbbbbbbbbbbbbb
3bbbbbbbbb3bbbbb3bbbbbbbccccccccc88c8c8cc88cc88cc88c888ccccc8c8cc88c8c8c888cccccc88c888c88cc888cccccccccbb3bbbbb3bbbbbbbbb3bbbbb
3bbbbbbbbbb3bbbb3bbbbbbbcccccccc888c8c8c888c888c888c888ccccc8c8c888c8c8c888ccccc888c888c888c888cccccccccbbb3bbbb3bbbbbbbbbb3bbbb
bbbbbbbbbbb3bbbbbbbbbbbbcccccccc877c888c878c878c877c877ccccc888c878c8c8c878ccccc877c787c878c877cccccccccbbb3bbbbbbbbbbbbbbb3bbbb
bbbbbb3bbbb3bbbbbbbbbb3bbccccccc8ccc888c8c8c8c8c888c88cccccc888c8c8c8c8c887ccccc888cc8cc8c8c88cccccccccbbbb3bbbbbbbbbb3bbbb3bbbb
bbbbb3bbbbbbbbbbbbbbb3bb3bcccccc888c878c888c888c778c878ccccc778c888c888c878ccccc778c888c888c878cccccccb3bbbbbbbbbbbbb3bbbbbbbbbb
bbbbb3bbbbbbbb3bbbbbb3bb3bbccccc788c8c8c887c887c887c888ccccc888c887c788c8c8ccccc887c888c888c888ccccccbb3bbbbbb3bbbbbb3bbbbbbbb3b
b3bbb3bbbbbbb3bbb3bbb3bbb3bbbcccc77c7c7c77cc77cc77cc777ccccc777c77ccc77c7c7ccccc77cc777c777c777ccccbbb3bbbbbb3bbb3bbb3bbbbbbb3bb
bb3bbbbbb3bbb3bbbb3bbbbbbbbb3bccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccb3bbbbb3bbb3bbbb3bbbbbb3bbb3bb
bb3bbbbbbb3bbbbbbb3bbbbbbbbb3bbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbb3bbbbbb3bbbbbbb3bbbbbbb3bbbbb
bb3bbbbbbb3bbbbbbb3bbbbbbbb3bbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbb3bbbbb3bbbbbbb3bbbbbbb3bbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbb
bbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bb
bbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bbbbbb3bbbbbbbb3bb
b3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbb
3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb3bbbbbbbbb3bbbbb
3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb3bbbbbbbbbb3bbbb
bbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbbbbbbbbbbbbb3bbbb

__gff__
0000000000000000000101000001010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000001010101010101010000000101010101000000000000000000000000000001010000000000000000000000000100010100000002020000000001010001000101
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000090a090a090a090a090a090a090a090a090a000b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000191a191a191a191a191a191a191a191a191a001b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000090a090a090a090a090a090a090a090a090a000b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000191a191a191a191a191a191a191a191a191a001b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000090a090a090a090a090a090a090a090a090a000b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000191a191a191a191a191a191a191a191a191a001b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074
0000000000000000000000000000000000090a090a0d0e0d0e0d0e0d0e0d0e090a090a000b0c0b0c0d0e0d0e0d0e0d0e0d0e0b0c0b0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e3e47d0000000000000000000000000000000000000000000074
000000003b3c00000000393a0000000000191a191a1d1e1d1e1d1e1d1e1d1e191a191a001b1c1b1c1d1e1d1e1d1e1d1e1d1e1b1c1b1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000004b00000000e0e0e00000000000004b00000000000000000000000000000074
0000000000000000000000000000000000090a090a0d0e0d0e0d0e0d0e0d0e090a090a000b0c0b0c0d0e0d0e0d0e0d0e0d0e0b0c0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000004b0000004b0000e0e0e07d0000004f000000000000000000000000000000000074
1e1e1d1e1d1e1d1e1d1e1d1e1d1e1d1e1e191a191a1d1e1d1e1d1e1d1e1d1e191a191a001b1c1b1c1d1e1d1e1d1e1d1e1d1e1b1c1b1c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e0e0e0e10000000000004e000000000000000000000000000074
0e0d0e0f00000000000000001f0d0e0d0e090a090a0d0e0d0e0d0e0d0e0d0e090a090a000b0c0b0c0d0e0d0e0d0e0d0e0d0e0b0c0b0c0000000000000000000000000000000000000000000000f70000000000e37c7c7c7c7c7c7c7c7c7c7c7c7c7d0000007be0e0e00000000000000000000000000000000000000000000074
1e1d1e000000000000000000001d1e1d1e191a191a1d1e1d1e1d1e1d1e1d1e191a191a001b1c1b1c1d1e1d1e1d1e1d1e1d1e1b1c1b1c000000000000000000000000000000000000000000005df65d00000000e0e1e0e0e0e1e0e0e1e0e0e0e1e0e0e9ea00e1e0e0e0000000e9ea00000000000000000000ebeb000000000074
0e0d0e000000000000000000000d0e0d0e090a090a0d0e0d0e0d0e0d0e0d0e090a090a000b0c0b0c0d0e0d0e0d0e0d0e0d0e0b0c0b0c00000000000000000000000000000000000000000000f47cf500000000e0e0e0e1e0e0e0e0e0e0e0e0e0e0e1f9fa0000e0e0e0f30000f9fa0000000000000000f7e9e8e8ea0000000074
1e1d1e3f00000000000000002f1d1e1d1e191a191a1f1e1d1e1d1e1d1e1d0f191a191a001b1c1b1c1f1e1d1e1d1e1d1e1d0f1b1c1b1c0000000000000000000000000000000000000000000079007a00e600e5e1e2e0e0e0e2e1e0e0e2e1e0e0e2e0797ae600e0e2e0e700e5797ae5e5005c5b0000e3e2e7e4e4e77d00000074
0e0d0e0d0e0d0e0d0e0d0e0d0e0d0e0d0e090a090a090a090a090a090a090a090a090a000b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c002b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b2b402b2b434445464740414243444546474041424344454647404142434445464740414243444546474041424344e0e0e0e0e0e0e0e0454647
1e1d1e1d1e1d1e1d1e1d1e1d1e1d1e1d1e191a191a191a191a191a191a191a191a191a001b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c1b1c002c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000004e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000004e00000000000000000000000000004b00004d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002f
0000000000000000000000000000000000000000000000000000004d004c00000000000000004e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000777800000000000000777800000000000000000000000000000000000000000000000000000000000000000d
00000000000000000000000000000000000000000000000000004b004f00000000000000004e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000797a00000000000000797a000000000000000000000000000000000000000000000000000000000000002f0d
0000000000000000000000000000000000000000000000000000004e004b000000000000000000004e00000000000000000000004e00000000000000000000000000000000000000000000000000000000000000797a0000005f000000797a0000000000000000000000000000000000000000000000000000000000002f0d0d
000000000000000000000000000000000000000000000000000000000000000000000000007b7c7c7d00000000000000004c00000000000000000000000000000000000000000000000000000000000000000000797a00007f5f6f0000797a00000000000000000000000000000000000000000000000000000000002f0d0d0d
0000000000000000000000000000000000000000000000000000000000000000000000007b7c7c7c7c000000000000000000000000004b00000000004f0000000000000000000000000000000000000000000000797a00007f5f6f3400797a00000000000000000000000000000000000000000000000000000000000d0d0d0d
0000000000000000000000000000000000000000000000000000000000000000000000007f5e5f5e6f000000000000000000004e000000000000000000004d000000000000000000000000000000000000000000797a357f5e5e5e6f00797a000000000000000000000000000000000000000000000000000000002f0d0d0d0d
0000000000000000000000000000000000000000000000000000000000000000000000007f5e5f5e6f000000000000000000000000000000000000004c000000000000000000000000000000000000000000007b7e7e7e7e7e7e7e7e7e7e7e7d0000000000000000000000000000000000000000000000000000000d0d0d0d0d
000000000000000000000000000000000000000000000000000000007b7c0000000000007f5e5f5e6f000000000000000000000000000000000000000000004c000000000000000000000000000000000000007e7e7e7e7e7e7e7e7e7e7e7e7e0000000000000000000000000000000000000000000000000000000d0d0d0d0d
0000000000000000000000000000005c6c5b000000000000000000007e7e7d00000000007f5e5f5e6f00000000000000000000000000000000000000004b000000000000000000000000000000000000000000484900487e7e7e7e7e4900484900000000000000000000000000000000000000000000000000002f0d0d0d0d0d
00000000000000000000000000005c6c6c6c5b0000000000000000007e7e7e00000000005d005d005d0000000000000000000000007778000000000000000000000000000000000000000000007b7c7d00000000000000002a2a2a740000000000000000000000000000000000000000000000000000000000000d0d0d0d0d0d
000000000000000000000000005c6c6c6c6c6c5b00000000000000007e7e7e00000000006d005d005d0000000000000000004b0000797a000000000000000000000000000000000000000000005d6e5d00000000000000002a2a2a7400000000000000000000000000000000000000000000000000000000002f0d0d0d0d0d0d
0000000000000000000000005c6c6c6c6c6c6c6c5b000000000000007e7e7e00000000005d005d005d000000000000000077780000797a000000000000000000000000000000000000000000007f5e5e00000000000000002a2a2b74000000000000330000000000000000000000000000000000000000002f0d0d0d0d0d0d0d
__sfx__
7805001c100070f020120201502016020226402a0071150004240072401f600115001750017500290072264018440175001750030243115002a0072264015220112200e2200b2200822008200000000000000000
48010e100000000000000000000000000000000000000000000000000000000000000000000000000001f62000000000000000000000000000000000000000000000000000000000000000000000000000000000
480600000c0500b0500b0500c0500c0500d0500f0500f0501105013050160501a0501e0501a0001e0001f60000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400000000000000000000000004440084401764001440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
440300201000000000000001464400002000022a00200002000020000214644000020000200002290020000200002000021364400000000002a00000000000000000000000000000000000000000000000000000
a132000c2a200077700377002770027702a2002920005770037700077000770007022b2002b200082002b2002b2002b2002b2002b2002b2002b20009200092000a2000a2000a2000a2000b2000b2000b2000b200
48200017156101c61022610306102c61027610176101b610206102b610266101e6101a6101d610226102c610336103a6102b610256101f6101561012610000000000000000000000000000000000000000000000
ce3c0013190521b0521d052200522205223052200521d0521c0521d0521d0521f05220052220522305225052260522505222052200521d5020000200002000020000200002000020000200002000020000200000
991d02121960027600366352c6352b635281053a635316352a6351d50530635306353963522505326353d5052a6353d50522505205051d5053c5053c5053c5053c5053c5053c5053c5053c505005020050000500
011d00101b7752077522775257751e70522705207702777023770277701e77000000106002770023700277001e700000000000000000000000000000000000000000000000000000000000000000000000000000
911d0010000000000000000000000000010500000000b5001450000000065700a5700000012570000000350000000000000000000000000000000000000000000000000000000000000000000000000000000000
7f1700170c7500c7300c7201175011730117201575015730157200e7500e7300e720000000c750117501575513750137401373013720137101370000000000000000000000000000000000000000000000000000
a12800000c6750c6550c6250c6250c6250060005600096000c6750c6550c6250c625000000000000000000000c6750c6550c6250c6250c6250000000000000000c6750c6550c6250c62500000000000000000000
001000001677000000000000a770000000000000000067700675006730067100000016770000000f7700670003770037400372003710000000f70000000000000370003700037000370000000000000000000000
01280000055000000000000000000550005524055540557400000000000000000000000000c574000000000000000000000000000000000000552405554055740000000000000000000005500095740550000000
012500000c0501305010050100500c050130501705017050100001700013000100001700015000150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a515001e0060027700207002e700003000035022700003502770000350277000035000000003502770023700277001e700000000c350227000c350277000c350277000c350000000c350000000c3500000000000
0215001e187501873021750217301c7501c7302375023720396000000032600000001d60005600187500c73015750097303475010730177502f72000000000000000000000000000000000000000000000000000
0015001e000000000000000000000060027700207002e700003000033022700003302770000330277000023000000003002770023700277001e7000000000330227000c33027700183202770018220000000c300
__music__
02 00040344
03 08090a44
03 0c0e4344
03 11101244

