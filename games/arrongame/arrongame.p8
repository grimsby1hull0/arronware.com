pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- initialise
function _init()
	
	
	
	
	-- find me a solid arr
	function solid_at(px,py)
	 -- pixel x pos to tilex div 8
	 -- (tile size) and rounds down
		tile_x=flr(px / 8)
		-- py pos into tiley
		tile_y=flr(py / 8)
		-- gets tile num from map tile pos
		tile=mget(tile_x, tile_y)
		-- returns solid flag
		return fget(tile,0)
		
	
	
	end
	
	
	
	-- find me a half solid arr
	function half_at(px,py)
	 -- pixel x pos to tilex div 8
	 -- (tile size) and rounds down
		tile_x=flr(px / 8)
		-- py pos into tiley
		tile_y=flr(py / 8)
		-- gets tile num from map tile pos
		tile=mget(tile_x, tile_y)
		-- returns solid flag
		return fget(tile,1)
		
	
	
	end
	
	
	
	
	
	
	--change back to 0 after testing
	page=1
	
	titlesfx_played=false

	page1_music=false
	
	page2_music=false
	
	page3_music=false
	
	
	
	-- title page transition
	trans_title=false
	
	-- grass and mini arron go
	grass=128
	mini_face_me=100
	
	-- start button prompt
	startbutton=40
	
	-- sun
	title_sun_white=49
	title_sun_yello=50
	
	



	-- character selection
	ar_sel=false
	an_sel=false



	-- Menu Arron main var
	pg1_ar = {
		x=50,
		y=45,

		spr=50,

		reached=false,

		fall=0,

	}

	-- Menu Antonia main var
	pg1_an = {
		x=50,
		y=45,

		spr=50,

		reached=false,

		fall=0,

	}
	

	accel=1
	--if they are walked, 
	--change spr
	walk=false
	
	cloudx1=0
	cloudx2=72
	
	
	
	
	
	
	
	
	
	
	


	
	--pg.2 - level 1
	
	arron= {
		--animation states
		spr=0,

		-- position
		x=10,
		y=20,

		--x y velocity
		dx=0,
		dy=0,


		-- are they able to jump?
		can_jump=false,


	}




	antonia= {
		--animation states
		spr=0,

		-- position
		x=10,
		y=-10,

		--x y velocity
		dx=0,
		dy=0,


		-- are they able to jump?
		can_jump=false,


	}

	

	--flip? when to flip spr
	flip_=false
	
	--movement ani detect (l or r)
	moving=false
	
	-- facing dir (-1 or 1)
	facing=1
	
	--initial fall landing
	landed_played=false
	
	
	

	-- environmental animation variables
	
	ggrass=5
	
	campfire=24
	
	frame=0
	
	starbg_y=0
	
	water=53
	
	floppy=64
	
	lantern=9
	
	
	
	


end


















































-->8
-- draw
function _draw()
--	cls(12)







	-- global animations
	
	if frame % 15 == 0 then
			if campfire==24 then
				campfire=25
				starbg_y=60
				else
					campfire=24
					starbg_y=0
				
			end
	end
		
		
	--stars animation
	if frame % 15 == 0 then
		if starbg_y==0 then
			starbg_y=10
			else
				starbg_y=0
			
		end
	end
		
		
		
		
		
		
		--water animation
		if frame % 7 == 0 and water>=20 then

				if water==56 then
					water=53
				
					
				elseif water==53 then
					water=54
				
					
				elseif water==54 then
					water=55
				
					
				elseif water==55 then
					water=56
				
			end
			
			
		end
		
		
		
		--lantern flicker ani
		if frame % 17 == 0 then

				if lantern==9 then
					lantern=10
				
					
				elseif lantern==10 then
					lantern=11
				
					
				elseif lantern==11 then
					lantern=9
				
				end
			
			
		end
		
		
		
		
		-- floppy dude
		if frame % 15 == 0 then
			if floppy==64 then
				floppy=66
				else
					floppy=64
				
			end
	end


















	--global movement
	if page>=2 then

		-- !!!! trying something new REUSE THIS CODE IF NEW THING DOESNT WORK

		-- if ar_sel then
		-- 	-- arron movement
			
		-- 	-- jump
			
		-- 	-- right jump
		-- 	if btn(2) and not arron.can_jump and facing==1 then
		-- 		facing=1
		-- 		if frame % 3 == 0 then
		-- 		 arron.spr=(arron.spr==49) and 60 or 49
					
		-- 		end
		-- 		flip_=true
				
		-- 	-- left jump
		-- 	elseif btn(2) and not arron.can_jump then
		-- 		facing=-1
		-- 		if frame % 3 == 0 then
		-- 		 arron.spr=(arron.spr==49) and 60 or 49
		-- 		end
		-- 		flip_=false
	
	
	
			
			
			
			
		-- 	-- arron walk animation
		-- 	-- right
		-- 	elseif btn(1) and not btn(3) and moving then
		-- 		facing=1
		-- 		if frame % 8 == 0 then
		-- 		 arron.spr=(arron.spr==17) and 33 or 17
		-- 		end
		-- 		flip_=true
				
		-- 	-- left
		-- 	elseif btn(0) and not btn(3) and moving then
		-- 		facing=-1
		-- 		if frame % 8 == 0 then
		-- 		 arron.spr=(arron.spr==17) and 33 or 17
		-- 		end
				
		-- 		flip_=false
	
	
		-- 	-- crouch animations
			
		-- 	-- idle crouch right
		-- 	elseif btn(3) and facing==1 
		-- 	and not moving then
		-- 		facing=1
		-- 		arron.spr=62
		-- 		flip_=true
			
		-- 	-- idle crouch left
		-- 	elseif btn(3) and facing==-1 
		-- 	and not moving then
		-- 		facing=-1
		-- 		arron.spr=62
		-- 		flip_=false
	
		-- 	-- right crouch
		-- 	elseif btn(3) and btn(1) 
		-- 	and moving then
		-- 		facing=-1
		-- 		if frame % 4 == 0 then
		-- 		 arron.spr=(arron.spr==19) and 20 or 19
		-- 		end
				
		-- 		flip_=true
				
		-- 	-- left crouch
		-- 	elseif btn(3) and btn(0) 
		-- 	and moving then
		-- 		facing=-1
		-- 		if frame % 4 == 0 then
		-- 		 arron.spr=(arron.spr==19) and 20 or 19
		-- 		end
				
		-- 		flip_=false
	
				
		-- 	else
		-- 	-- right idle
		-- 		if facing==1 then
		-- 			moving=false
		-- 			arron.spr=1
		-- 			flip_=true
		-- 		end
		-- 		--left idle
		-- 		if facing==-1 then
		-- 			moving=false
		-- 			arron.spr=1
		-- 			flip_=false
		-- 		end
		-- 	end
		-- end
		
		



		-- if antonia selected 
		






























	if ar_sel then

		moving = btn(0) or btn(1)

		-- jump animations
		if not arron.can_jump and facing==1 then
			if frame % 2 == 0 then
				arron.spr = (arron.spr==49) and 60 or 49
			end
			flip_=true

		elseif not arron.can_jump and facing==-1 then
			if frame % 2 == 0 then
				arron.spr = (arron.spr==49) and 60 or 49
			end
			flip_=false

		-- walk animations
		elseif btn(1) and not btn(3) and moving then
			facing=1
			if frame % 4 == 0 then
				arron.spr = (arron.spr==17) and 33 or 17
			end
			flip_=true

		elseif btn(0) and not btn(3) and moving then
			facing=-1
			if frame % 4 == 0 then
				arron.spr = (arron.spr==17) and 33 or 17
			end
			flip_=false

		-- crouch idle
		elseif btn(3) and facing==1 and not moving then
			arron.spr=62
			flip_=true

		elseif btn(3) and facing==-1 and not moving then
			arron.spr=62
			flip_=false

		-- crouch walk
		elseif btn(1) and btn(3) and moving then
			facing=1
			if frame % 4 == 0 then
				arron.spr = (arron.spr==19) and 20 or 19
			end
			flip_=true

		elseif btn(0) and btn(3) and moving then
			facing=-1
			if frame % 4 == 0 then
				arron.spr = (arron.spr==19) and 20 or 19
			end
			flip_=false

		-- idle
		else
			moving=false
			arron.spr=1
			flip_ = (facing==1)
		end
	end










		
		
		
		
		-- if antonia selected 
		
		if an_sel then
			-- antonia movement
			
			-- jump
			
			-- right jump
			if not antonia.can_jump and facing==1 then
				facing=1
				if frame % 2 == 0 then
				 antonia.spr=(antonia.spr==50) and 61 or 50
					
				end
				flip_=true
				
			-- left jump
			elseif not antonia.can_jump then
				facing=-1
				if frame % 2 == 0 then
				 antonia.spr=(antonia.spr==50) and 61 or 50
				end
				flip_=false
	
			
			-- antonia walk animation
			-- right
			elseif btn(1) and not btn(3) and moving then
				facing=1
				if frame % 4 == 0 then
				 antonia.spr=(antonia.spr==18) and 34 or 18
				end
				flip_=true
				
			-- left
			elseif btn(0) and not btn(3) and moving then
				facing=-1
				if frame % 4 == 0 then
				 antonia.spr=(antonia.spr==18) and 34 or 18
				end
				
				flip_=false
	
	
			-- crouch animations
			
			-- idle crouch right
			elseif btn(3) and facing==1 
			and not moving then
				facing=1
				antonia.spr=63
				flip_=true
			
			-- idle crouch left
			elseif btn(3) and facing==-1 
			and not moving then
				facing=-1
				antonia.spr=63
				flip_=false
	
			-- right crouch
			elseif btn(3) and btn(1) 
			and moving then
				facing=-1
				if frame % 4 == 0 then
				 antonia.spr=(antonia.spr==35) and 36 or 35
				end
				
				flip_=true
				
			-- left crouch
			elseif btn(3) and btn(0) 
			and moving then
				facing=-1
				if frame % 4 == 0 then
				 antonia.spr=(antonia.spr==35) and 36 or 35
				end
				
				flip_=false
	
				
			else
			-- right idle
				if facing==1 then
					moving=false
					antonia.spr=2
					flip_=true
				end
				--left idle
				if facing==-1 then
					moving=false
					antonia.spr=2
					flip_=false
				end
			end
		end
		
	end



















	if page==0 then

--home page

		


	--circles behind characters--
	
	-- sun and white
	circ(60,title_sun_white,20,7)
	circfill(60,title_sun_yello,20,10)
	circfill(43,66,20,7)
	circfill(75,66,20,8)
	
	--text--
	print("arron"
	,26,63,14)
	
	print("\\__=__/"
	,46,76,9)
	
	print("antonia"
	,66,63,14)
	
	
	
	
	
	
	
--characters--
	-- main arron
	spr(1,50,70)
	-- main antonia
	spr(2,60,70)
	-- mini grass arron
	spr(4,50,mini_face_me)
	spr(64,60,70)
	
	
	print("🅾️ to start"
	,startbutton,93,7)
	
	
	--dark grass
	circfill(128,grass,20,3)
	circfill(1,grass,20,3) 
	--lightgrass--
	circfill(35,grass,20,11)
	circfill(94,grass,20,11) 
	circfill(55,grass,20,11)
	circfill(75,grass,20,11)
	
		
	
	
	
	
	
	
	
	
	
	
	elseif page==1 then
		if not page1_music then
			sfx(-1)
			sfx(1)
			page2_music=false
			page1_music=true
			
		end
		cls(12)
		
		
		
		
		-- sun and white
		circ(60,69,20,7)
		circfill(60,70,20,10)
		
		
	 
		--lightgrass--
		circfill(20,85,20,11)
		circfill(99,85,20,11) 
		circfill(60,85,20,11)
		circfill(80,85,20,11)
		
		--cloud
		sspr(64, 0, 8, 8, cloudx1, 20, 60, 25)
		sspr(64, 0, 8, 8, cloudx2, 25, 40, 25)
		
		
		--sign
		rectfill(18, 10, 104, 30, 4)
		-- sign shading
		rectfill(18, 30, 104, 30, 2)
		rectfill(105, 10, 105, 29, 2)
		
		
		--bricks
		--top row
		sspr(56, 0, 8, 8, 0, 63, 20, 20)
		
		sspr(56, 0, 8, 8, 40, 63, 20, 20)
		
		sspr(56, 0, 8, 8, 80, 63, 20, 20)
		
		sspr(56, 0, 8, 8, 120, 63, 20, 20)
		
		--chain row
		sspr(56, 0, 8, 8, 0, 73, 20, 20)
		sspr(56, 0, 8, 8, 20, 73, 20, 20)
		sspr(56, 0, 8, 8, 40, 73, 20, 20)
		sspr(56, 0, 8, 8, 60, 73, 20, 20)
		sspr(56, 0, 8, 8, 80, 73, 20, 20)
		sspr(56, 0, 8, 8, 100, 73, 20, 20)
		sspr(56, 0, 8, 8, 120, 73, 20, 20)
		--below
		sspr(56, 0, 8, 8, 0, 88, 20, 20)
		sspr(56, 8, 8, 8, 20, 88, 20, 20)
		sspr(56, 8, 8, 8, 40, 88, 20, 20)
		sspr(56, 8, 8, 8, 60, 88, 20, 20)
		sspr(56, 8, 8, 8, 80, 88, 20, 20)
		sspr(56, 8, 8, 8, 100, 88, 20, 20)
		sspr(56, 0, 8, 8, 120, 88, 20, 20)

		sspr(56, 8, 8, 8, 0, 108, 20, 20)
		sspr(56, 8, 8, 8, 20, 108, 20, 20)
		sspr(56, 8, 8, 8, 40, 108, 20, 20)
		sspr(56, 8, 8, 8, 60, 108, 20, 20)
		sspr(56, 8, 8, 8, 80, 108, 20, 20)
		sspr(56, 8, 8, 8, 100, 108, 20, 20)
		sspr(56, 8, 8, 8, 120, 108, 20, 20)

		
		
		--character platform
		rectfill(8, 92, 120, 98, 4)
		rectfill(8, 99, 120, 100, 2)
		
		--top left chains
		spr(6, 16, 6)
		spr(6, 15, 2)
		spr(6, 14, -2)
		--top right chains
		spr(6, 100, 6)
		spr(6, 101, 2)
		spr(6, 102, -2)
		
		--bottom left chains
		spr(6, 10, 86)
		spr(6, 8, 83)
		spr(6, 6, 80)
		--ball
		spr(6, 10, 86)
		spr(6, 8, 83)
		spr(6, 6, 80)
		--bottom right chains
		
		--ball
		spr(6, 110, 86)
		spr(6, 112, 83)
		spr(6, 109, 80)
		
		
		
		print("choose your character", 20, 20, 7)
		
		
		
		-- arron
		print("❎ arron", 21, 101, 1)
		print("❎ arron", 20, 100, 7)
		
		-- sspr(8, pg1_ar.fall, 8, 8, 14, pg1_ar.spr, pg1_ar.x, pg1_ar.y)

		sspr(8, pg1_ar.fall, 8, 8, 14, pg1_ar.spr, pg1_ar.x, pg1_ar.y)
	
		-- antonia
		print("🅾️ antonia", 66, 101, 1)
		print("🅾️ antonia", 65, 100, 7)
		
		sspr(16, pg1_an.fall, 8, 8, 54, pg1_an.spr, pg1_an.x, pg1_an.y)
	
		

	
		
	













	
		
		


	elseif page==2 then
	
		if not page2_music then
			sfx(-1)
			sfx(12)
			page1_music=false
			page2_music=true
		end
		
		cls(1)
	
		
		--stars
		map(17, starbg_y, 0, 0, 128, 13)
		
		
		--cloud
		sspr(64, 0, 8, 8, cloudx1, 20, 60, 25)
		sspr(64, 0, 8, 8, cloudx2, 25, 40, 25)
		
		--grass and tower
		map(0, 0, 0, 0, 128, 128)
		
		
		--campfire
		spr(campfire,80,75)
		
		
		
		-- abominable
		spr(22, 100, 78)
		
		-- lantern
		spr(lantern, 32, 62)
		
		
		
		
		
		
		
		
		
		
		
		-- show characters
		
		
		spr(floppy, 62, 68, 2, 2)
		
		-- show arron
		if ar_sel then
			spr(arron.spr,arron.x,arron.y,1,1,flip_)
		end
		
		-- show antonia
		if an_sel then
			spr(antonia.spr,antonia.x,antonia.y,1,1,flip_)
		end
		
		
		--water spr
		spr(water,96,81)
		spr(water,104,81)
		

--		if arron.x==
		
		
		
		
		
		
		
		
		
		
	
	
	
	
	elseif page==3 then
			if not page3_music then
				sfx(-1)
				music(0)
				page3_music=true
			end
	
	
	
			cls(1)
			
			
			--stars
			map(17, starbg_y, 0, 0, 128, 13)
			
			
			--cloud
			sspr(64, 0, 8, 8, cloudx1, 20, 60, 25)
			sspr(64, 0, 8, 8, cloudx2, 25, 40, 25)
			
			
			
			--grass and tower
  			map(33, 0, 0, 0, 128, 128)
			
			
			--water spr
			spr(water,40,80)
			spr(water,48,80)
			
			--campfire
  			spr(campfire,80,75)
			
		
			-- show arron
			if ar_sel then
				spr(arron.spr,arron.x,arron.y,1,1,flip_)
			end
			
			-- show antonia
			if an_sel then
				spr(antonia.spr,antonia.x,antonia.y,1,1,flip_)
			end

			-- print("hello", 60, 60, 7)
		
		
	end








end














































-->8
-- update
function _update()


	

 if page==0 and trans_title==false and not titlesfx_played and btnp(4) then
 	trans_title=true
 	sfx(7)
 	titlesfx_played=true
 end
 
 if trans_title do
 	grass+=1
 	mini_face_me+=1
 	startbutton-=3
 	title_sun_white-=2
 	title_sun_yello-=2
 	
 	
 
 	
 	
 	
 	if grass>180 then 
	 	trans_title=false
	 	page=1
 	end
 	
 	
 	
 	
 	
 end
 
 
 if page==1 then
  
 		cloudx1+=0.2
 		cloudx2+=0.4
 		
 		if cloudx1>125 then
 			cloudx1=-90
 		end
 		
 		if cloudx2>125 then
 			cloudx2=-50
 		end
 		
 		
 		
 		
 		
 		
 		--❎ input for antonia
 		if btnp(4) and ar_sel==false and an_sel==false then
 			sfx(4)
 			an_sel=true
 		end
 			 
 			
 			
			if an_sel==true and pg1_an.reached==false then
				antonia.spr=2
			 pg1_an.spr-=2.5 
			 
			 if pg1_an.spr<43 then
			 	pg1_an.reached=true
			 
			 end
			end
			 

			 
			
			
			if pg1_an.reached then
				
					pg1_an.spr+=accel
					accel+=0.5
					
					
					pg1_an.x-=1
					pg1_an.y-=1
					-- set antonia fall spritesheet Y for pg1
					pg1_an.fall=24
				
				
				if pg1_an.spr > 140 then
					page=2
				end
				
			end
	 	
 				
 				
 	
 		
 		
 		
 		
 		--🅾️ input for arron
 		if btnp(5) and an_sel==false and ar_sel==false then
 			sfx(4)
 			ar_sel=true
 		end
 			 
 			
 			
			if ar_sel==true and pg1_ar.reached==false then
				arron.spr=17
			 	pg1_ar.spr-=2.5 
			 
			 if pg1_ar.spr<43 then
			 	pg1_ar.reached=true
			 
			 end
			end
			 

			 
			
			
			if pg1_ar.reached then
				
					pg1_ar.spr+=accel
					accel+=0.5
					
					
					pg1_ar.x-=1
					pg1_ar.y-=1
					-- set arron fall spritesheet Y for pg1
					pg1_ar.fall=24
				
				
				if pg1_ar.spr > 128 then
					page=2
				end
				
			end
 	
 		end
 
 
 
 
 
 
 
 
 
 
 
 
 
 if page==2 and (arron.x >= 127 or antonia.x >= 127) then
	page=3
	arron.x=3
	arron.y=74
	antonia.x=3
	antonia.y=74
 end

 if page==3 and (arron.x <= -8 or antonia.x <= -8) then
	page=2
	arron.x=126
	arron.y=74
	antonia.x=126
	antonia.y=74
 end
 
 -- page 2
 
 if page==2 then


	


  
  
  --cloud movement
 		cloudx1+=0.05
 		cloudx2+=0.1
 		
 		-- big cloud
 		if cloudx1>125 then
 			cloudx1=-90
 		end
 		-- small cloud
 		if cloudx2>125 then
 			cloudx2=-50
 		end
 end
 
 
 
 
 
 
 
 -- if moving set true
 moving=false
	-- flip player sprite?
 flip_=false
 
 
 --level 1 arron
 if page>=2 and ar_sel then
 
 
--!!!!! causes walking animation to break
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- 	--default falling ani
-- 	-- if not on solid then fall spr
-- 	if solid_at(arron.x,arron.y)  then
-- 		arron.spr= (facing==1) and 49 or 33
-- 		else
-- 		arron.spr= (facing==1) and 17 or 1
-- 	end
 
 
 
 --- sprite changing


  -- movement input
		
		
		-- move left
		if btn(0) then
			arron.x-=1
			facing=-1
			moving=true
		
		end
		
		
		
		--move right
		if btn(1) then
			arron.x+=1
			
			facing=1
			moving=true

		
		end
		
		-- jump input
		if btnp(2) and arron.can_jump then
			arron.dy=-5
			arron.can_jump=false
			landed_played=false	
		 
		end
		
		
		
		
		
		
		
		
		--gravity
		
		-- arron grav
		arron.dy+= 0.5
		arron.y+= arron.dy
		
		
		
		-- -- hori collision
		
		
		-- --half
		-- --right
		-- local next_x=arron.x + 1
		-- if not half_at(next_x+7,arron.y)
		-- and not half_at(next_x+7, arron.y+7) then
		
		-- 	arron.x += 1
		
		-- end
		
		-- --left
		-- local next_x=arron.x + 1
		-- if not half_at(next_x,arron.y)
		-- and not half_at(next_x, arron.y+7) then
		
		-- 	arron.x -= 1
		
		-- end
		
		-- --solids
		-- --right
		-- local next_x=arron.x + 1
		-- if not solid_at(next_x+7,arron.y)
		-- and not solid_at(next_x+7, arron.y+7) then
		
		-- 	arron.x += 1
		
		-- end
		
		-- --left
		-- local next_x=arron.x + 1
		-- if not solid_at(next_x,arron.y)
		-- and not solid_at(next_x, arron.y+7) then
		
		-- 	arron.x -= 1
		
		-- end
		
		
		
		
		
		
		-- -- hitting my head
		-- -- stops me when i hit block
		-- local head = arron.y
		-- if solid_at(arron.x, head) or solid_at(arron.x+7, head) then
		-- 	if arron.dy < 0 then
		-- 		arron.dy = 0
		-- 	end
		-- end
		
		
		
		
		
		
		
		
		
		
		-- calculates bottom of y
		
		local arron_foot = arron.y + 8
		
		if half_at(arron.x, arron_foot) then
			-- no velocity
			arron.dy = 0
			-- snaps to top of tile
			--       this rounds down
			arron.y = flr(arron_foot / 8) * 8 - 4
			-- enable jumping ability
			arron.can_jump=true
		
		-- if player on solid
		elseif solid_at(arron.x, arron_foot) then
			-- no velocity
			arron.dy = 0
			-- snaps to top of tile
			--       this rounds down
			arron.y = flr(arron_foot / 8) * 8 - 8
			-- enable jumping ability
			arron.can_jump=true
			
			else
		 -- apply gravity
			arron.y += arron.dy
			
		end
		
		
		
		if fget(tile, 0) then
			--solid tile
		end
		
		if fget(tile, 1) then
			arron.y = flr(arron_foot / 8) * 8 - 4
			arron.can_jump=true
			
			
			
		
		end
		
		if arron.can_jump and not landed_played then
			sfx(13)
			landed_played=true
		end
	
		
	end
 
 
 -- setting frame timer 
 -- for animation changes
 frame+=1
 
 
 
 
 
 
 --level 1 antonia
 if page>=2 and an_sel then
 
 
 --!!!!! causes walking animation to break
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
 	--default falling ani
 	-- if not on solid then fall spr
-- 	if solid_at(antonia.x,antonia.y)  then
-- 		antonia.spr= (facing==1) and 49 or 33
-- 		else
-- 		antonia.spr= (facing==1) and 17 or 1
-- 	end
 
 
 
 
 
 
 
 --- sprite changing
 	
 	
  -- movement input
		
		
		-- move left
		if btn(0) then
			antonia.x-=1
			facing=-1
			moving=true
		
		end
		
		
		
		--move right
		if btn(1) then
			antonia.x+=1
			facing=1
			moving=true

		
		end
		
		-- jump input
		if btnp(2) and antonia.can_jump then
			antonia.y-=20
			antonia.dy=-2
			antonia.can_jump=false
			landed_played=false
		
		 
		 
		 
		 
		 
		 
		 
		 
		 
		end
		
		
		
		
		
		
		
		
		--gravity
		
		-- antonia grav
		antonia.dy+= 0.5
		
		
		
		
		-- -- hori collision
		
		-- --solids
		-- --right
		-- local next_x=antonia.x + 1
		-- if not solid_at(next_x+7,antonia.y)
		-- and not solid_at(next_x+7, antonia.y+7) then
		
		-- 	antonia.x += 1
		
		-- end
		
		-- --left
		-- local next_x=antonia.x + 1
		-- if not solid_at(next_x,antonia.y)
		-- and not solid_at(next_x, antonia.y+7) then
		
		-- 	antonia.x -= 1
		
		-- end
		
		
		-- --half
		-- --right
		-- local next_x=antonia.x + 1
		-- if not half_at(next_x+7,antonia.y)
		-- and not half_at(next_x+7, antonia.y+7) then
		
		-- 	antonia.x += 1
		
		-- end
		
		-- --left
		-- local next_x=antonia.x + 1
		-- if not half_at(next_x,antonia.y)
		-- and not half_at(next_x, antonia.y+7) then
		
		-- 	antonia.x -= 1
		
		-- end
		
		
		
		-- -- hitting my head
		-- -- stops me when i hit block
		-- local head = antonia.y
		-- if solid_at(antonia.x, head) or solid_at(antonia.x+7, head) then
		-- 	if antonia.dy < 0 then
		-- 		antonia.dy = 0
		-- 	end
		-- end
		
		
		
		
		
		
		
		
		
		
		-- calculates bottom of y
		
		local antonia_foot = antonia.y + 8
		-- if player on solid
		if solid_at(antonia.x, antonia_foot) then
			-- no velocity
			antonia.dy = 0
			-- snaps to top of tile
			--       this rounds down
			antonia.y = flr(antonia_foot / 8) * 8 - 8
			-- enable jumping ability
			arron.can_jump=true
			
			
		elseif half_at(antonia.x, antonia_foot) then
			-- no velocity
			antonia.dy = 0
			-- snaps to top of tile
			--       this rounds down
			antonia.y = flr(antonia_foot / 8) * 8 - 4
			-- enable jumping ability
			arron.can_jump=true
			
			else
		 -- apply gravity
			antonia.y += antonia.dy
			
		end
		
		
		
		if fget(tile, 0) then
			--solid tile
		end
		
		if fget(tile, 1) then
			antonia.y = flr(antonia_foot / 8) * 8 - 4
			arron.can_jump=true
			
			
			
		
		end
		
		if arron.can_jump and not landed_played then
			sfx(13)
			landed_played=true
		end
	
		
	end
 
 
 -- setting frame timer 
 -- for animation changes
 frame+=1
 
 
 
 
 
 
 --level 1 antonia
 if page==2 and an_sel then
 	
 	
 	
 	--default falling ani
 		
-- 	if solid_at(antonia.x,antonia.y) then
-- 		antonia.spr= (facing == 1) and 34 or 50
-- 		else
-- 		antonia.spr= (facing ==1) and 2 or 18
-- 	end
 	
 	
 	
 	--animation changes per input
		
		--left
		if btn(0) then
			antonia.spr=18
		end
		--right
		if btn(1) then
			antonia.spr=2
		end
		--up
		if not antonia.can_jump then
			--right up
			if antonia.spr==2 or antonia.spr==35 then
			antonia.spr=34
			
			end
			--left up
			if antonia.spr==18 or antonia.spr==36 then
				antonia.spr=50
			end
			
		end
		
		
		--down/crouch
		--right
		if btn(3) then
			if antonia.spr==2 or antonia.spr==34 then
				antonia.spr=35
			end
			--left
			if antonia.spr==18 or antonia.spr==50 then
				antonia.spr=36
			end
			
		end
		
		
		
		
		
		
		
		
		
		
		

		
		
		-- move left
		if btn(0) then
			antonia.x-=1
			facing=-1
			moving=true
		
		end
		
		--move right
		if btn(1) then
			antonia.x+=1
			facing=1
		 moving=true
		
		end
		
		
		--jump input
		if btnp(2) and antonia.can_jump then
			antonia.y-=20
			antonia.dy=-2
			antonia.can_jump=false
			landed_played=false
		end
		
		
		
		
		
		
		
		
		
		
		--gravity
		
		
		
		
		-- antonia grav
		antonia.dy+= 0.5
		-- calculates bottom of y
		local antonia_foot = antonia.y + 8
		-- if player on solid
		if solid_at(antonia.x, antonia_foot) then
			-- no velocity
			antonia.dy = 0
			-- snaps to top of tile
			--       this rounds down
			antonia.y = flr(antonia_foot / 8) * 8 - 8
			-- enable jumping ability
			antonia.can_jump=true
			else
		 -- apply gravity
			antonia.y += antonia.dy
		end
		
		
		
		if fget(tile, 0) then
			--solid tile
		end
		
		if fget(tile, 1) then
			antonia.y = flr(antonia_foot / 8) * 8 - 4
			antonia.can_jump=true
			
		
		end
		
		
		if antonia.can_jump and not landed_played then
			sfx(13)
			landed_played=true
		end
		
		
		
		-- an_sel end
	end
 
 
 
 
 
 
 
 
 
 if page==3 then
 
  cloudx1+=0.05
 		cloudx2+=0.1
 		
 		if cloudx1>125 then
 			cloudx1=-90
 		end
 		
 		if cloudx2>125 then
 			cloudx2=-50
 		end
 end
 
 
 
 
 
 

end
__gfx__
000000000004440000044000000000000444444000000000000000009d93959300000000d0000000d0000000d0000000000060000000500000aaaa0000aaaa00
000000000044f400000f40000070070004fff444000000000766d50099d3d59900000000ddd00000ddd00000ddd0000000067600000565000000aa000000aa00
00000000000ff40000ff44000040040004f1f1f000000000060001505355535500066000055565000555650005556500000777000006660000020aa050020aa0
0000000000229220022e24000444444004fffff0bb3bbbb306000050395d939d0077776005a11600051a160005111600067777760566666550222aa075222aa0
0000000000229220022e2400040440400000f00034b4b334060000103d59939906777776051a1500051a1500051a1500006777600056665075060aa070560aa0
0000000000029200002e200000744700002292204544444406000050553555530777777705a8a50005a9a50005a9a500000777000006660070540aa070540aa0
0000000000050500001010000004400002299922444444540d56051099d3d3d906666676059896000598a6000592a6000006760000056500704aaaa0704aaaa0
000000000088088007707700000110000229992244544444000510003999959900000000055555000555550005555500000060000000500070aaaa0070aaaa00
00000000000444000004400000000000000000004534443400777700424341435000050000005005000000000000000000000000000000007000000000000007
000000000044f400000f4000000000000000000034444544077cc77044232144050a500550005000000000000000000000007000000000000700000000000070
00000000000ff40000ff4400000444000004440044444344881cc17813111311000a0000050a0050000000000000000000007000000000000700000000000070
0000000000229220022e24000044f4000044f4004354445467cccc863412434200aaa500000a0050000000000000000000077700000500000d200000000002d0
0000000000229220022e2400000ff400000ff40044444344687878763214434400a9a00000aaa000000000000000000000007000000000000ccc00000000ccc0
0000000000029200002e200002229222022292224544544367777776113111130a99aa000aa9a0000000000000000000000070000000005000ccc000000ccc00
00000000008805000770100002850502020505824444443407777770442323240a494a000a494a00000c0000000000000000000000000000000c00000000c000
000000000000088000007700000808800088080034543434044004403444414444040440440404400b0c08000000000000000000000050000000000000000000
000000000004440000044000000000000000000045344434007777000077770000000000000000000a9a9aa00000000000000000000000000000000000000000
000000000044f400000f4000000000000000000034444544077cc770077cc7700000000000000000077cc7700000000000000000000000000000000000000000
00000000000ff40000ff4400000440000004400044566344881cc178881cc1780000000000000000881cc1780000000000000000000000000000000000000000
0000000000229220022e2400000f4000000f40004355565467cccc8667cccc86000000000000000067cccc860000000000000000000000000000000000000000
0000000000229220022e240000ff444000ff44404556564468787876687878760000000000000000687878760000000000000000000000000000000000000000
0000000000029200002e2000222e2224222e22244566564367777770077777760000000000000000677777760000000000000000000000000000000000000000
00000000000508800010770020101720271010204555553404477770077774400000000000000000077777700000000000000000000000000000000000000000
00000000008800000770000007707000007077003454343400000440044000000000000000000000044004400000000000000000000000000000000000000000
0000000000044400000440000000000000000000000000000000000000000000000000009d939593424341430004440000044400000440000000000000000000
000000000044f400200f440000000000000000000000000000000000000000000000000099d3d599442321442044f4000244f402000f44020000000000000000
00000000020ff40222ff44420000000000000000c700c7000c700c70000c0c700007c0c75355535513111311020ff400020ff40220ff44400004440000044000
0000000002229222022e22400000000000000000ccc7ccc7cccccccc7ccc7cc77cccccccbb3bbbb3bb3bbbb30022922000229220222e22400044f400000f4000
0000000000029200002e200000000000000000007cccccccc7cccccccccccccccccccccc34b4b33434b4b3340002922000029200022e2000000ff40000ff4400
000000008059990070eee1070000000000000000cccccccccccccccccccccccccccccccc4544444445444444000292020009990000eee00002229222222e2220
0000000008000508071000700000000000000000cccccccccccccccccccccccccccccccc44444454444444540055055080500580701001000205050220101420
0000000000000080000000000000000000000000cccccccccccccccccccccccccccccccc44544444445444440880008808000800070007700088088007707700
00000000000000000000000000000000400000000000000434444144441444432666256600000000000000000001000000000000011010000000000000000000
01111111111111100000000000000000440000000000004444232320023232444661531600000000000000000111111110000011199911100000000000000000
1cc777575777cc100111111111111110131000000000013111311100001113113114665100000000000000000199991111111111199919100000000000000000
1cc757777757cc101cc777575777cc10341200000000214332144000000441236635166400007777777000000999991119999911119999100000000000000000
1cc775555577cc101cc757777757cc10321440000004412334120000000021436152311500777777777770001199911199999911119999100000000000000000
1ccccccccccccc101cc775555577cc10113111000011131113100000000001311466664207777777777777001999911999999999119999100000000000000000
1ccccccccccccc101ccccccccccccc10442323200232324444000000000000443516615677777777777777701999911999999999919991100000000000000000
1ccccccccccccc101ccccccccccccc10344441444414444340000000000000045231153177777777777777701991911111999111111111100000000000000000
1cccc6666666cc101ccccccccccccc10900000000000000939999599995999930000000077777777777777701111111999999999991111100000000000000000
1cccc6cc6666cc101cccc6666666cc10990000000000009999d3d3d00d3d3d990000000077777777777777701111111999111999991111000000000000000000
1cccc6cc6666cc101cccc6cc6666cc10535000000000053555355500005553550000000007777777777777700101119919919919991000000000000000000000
1cccc6cc6666cc101cccc6cc6666cc10395d00000000d5933d599000000995d30000000007777777777777700000011111999111111100000000000000000000
01ccc6666666cc101cccc6cc6666cc103d599000000995d3395d00000000d59300000000000777777777766000001cc111111111ccc100000000000000000000
001141111141110001ccc6666666cc105535550000555355535000000000053500000000000000066776670000001cc777777777ccc100000000000000000000
0000400000400000001141111141110099d3d3d00d3d3d99990000000000009900000000000000000000660000001cc777777777ccc100000000000000000000
000222000222000000022200022200003999959999599993900000000000000900000000000000000000000000001cccccccccccccc100000000000000000000
000000000000000000000000d51ddd15d51ddd1500000000000000000000000000000000000000000000000000001cccccccccccccc100000000000000000000
0000000000000000000000001dddd5dd1dddd5dd00000000000000000000000000000000000000000000000000001cccccccccccccc100000000000000000000
0000000000000000000000005dddd1dd5dddd1dd00000000000000000000000000000000000000000000000000001cccc6666666ccc100000000000000000000
000000000000000077777777d1dc7d5dd1d51d5d773bbbb33bbbb3770000000000000000000000000000000000001cccc6cc6666ccc100000000000000000000
000000000000000077777777d5dccdddd5dddddd77b4b334433b4b770000000000000000000000000000000000001cccc6cc6666ccc100000000000000000000
000000777600076071777717dddccdd1dd1dddd171444444444444170000000000000000000000000000000000001cccc6cc6666ccc100000000000000000000
00007766677607707d1711d15ddd5d155d5d5d157d144444444441d700000000000000000000000000000000000001ccc6666666cc1000000000000000000000
00076677766776701d61d6c61ddd1d1d1ddd1d1d1d6145c44c5416d1000000000000000000000000000000000000001111111111110000000000000000000000
00777766677767607777777726662566000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
067666777666776077777777166d5c16000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
661777666777767677777777cdd16651000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66176677766667767177771766c1d66100000000cc7cccc700000000000000000000000000000000000000000000000000000000000000000000000000000000
6111776667777676751711d16d52cdd500000000c7cc7c7c00000000000000000000000000000000000000000000000000000000000000000000000000000000
611d7677766667771d61d5cdd166661200000000ccc7cccc00000000000000000000000000000000000000000000000000000000000000000000000000000000
61dd7777677777775dc5d1d1c1d66d56000000007ccccc7c00000000000000000000000000000000000000000000000000000000000000000000000000000000
6ddd777777766777c1d1dc5d52cdd5c100000000cc7cc7cc00000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010000020001000000000000000000010100000100000000000000000000000101000001000000000000000000000001010000020202020202010101000000000000000000000100000000000000000000000202010100000000000000000000020101020200000000000000000000000101020200000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0717170700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07171707000000000000000000000000001d000c000000001c001c000d00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0717170700000000000000000000000000000000001c0000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07171707000000000000000000000000000000001d00000d00000000000e001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0717170700000000000000000000000000000d0000000000001c000d001e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
071717070000000000000000000000000000001c000c000000000000001d1c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07171707000000000000000000000000000000001d001c00000c001c0000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0717170744000000000000000000000000000c340000001d0000001d0c00001d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0717171747440000000000000000000000000000000000000000000000000000000000000000000000000000006061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0717171700474400000000000000000000000000000000000000000000000000000000000000000000000000007071000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
073a3a3a3a3a3a05050505050000050500000000000000000000000000000000006262626275000075626505667272726200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070707071515151515251515152515001d000d000000001c001c000c00000d006364646464636464646364646464646300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707482515151515151515151500000000001c0000000d000000000000006464636464646464646464646364646400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07070707070748151515151515251548000000001d00000c00000000000f001c007364646464646364646463646464637300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4848484848484848484848484848484800000c0000000000001c000c1f2c0000007373737373737373737373737373737300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
484848484848484848484848484848480000001c000d000000000000001d1c00007373737373737373737373737373737300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001d001c00000d001c0000000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000d000000001d0000001d0d00001d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0011002000000000001e0500000025050000002d0500000025050000000000000000000002d0500000000000000001c050000002105000000260502505000000000002c050230501e0501f00000000000002c050
5810002008520081200852007120085200d1201272015120127200b1200402008120040200d120067201c12011520257101f710257102d710111101c41011110191102751019110141103171021510135100b110
00100000000000505006050085500a0500c0500e550100501205007050090500b7500f0501175015050187500e0501105015050197501c75024750130501805019050120500c0500875008750097500a05008750
a41801200162102611026110362103621036110361103621036110361103611046110361103621046210462103611026110261103611046110562104621036110361104621056210462103621026110261102611
001000001c750177502870001700117001870017700137000f7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0011001c0000038b0730b060f77018b0514b0520b06047700470510b0404770203003030002001180010050728b051ab060000004752180002c3000275516b051a300148072830016b0414300000000000000000
a110001a0000000000000000c5510c5510c55111551115511055100000000000e5500e5500e5501155011550155500000011551155511d550000001a5501f5511855011550000000000000000000000000000000
58100000235502b7552b7552b755235552175511555155551855528755245002570000000235002b7002b7002b7002350021700115001550018500287000b5000850105501035012450103501095000a70000000
91100020016500463004630086300a6200a6300863006630056300564004630046500364003630036400365004630056400662006610076100763006620046300365002640026500163001640026200264001630
4823020b000000000013214162140a2140e2141321418214132140e2140a214000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
301e021b000000000009000283212832128321283212f3212f3212f3212f3212a3212300127001240012331123311233111f3211f3211d3211d31117311173111f3111f3111f3100000000000000000000000000
4823020b00000000001331316513053130e113135131d31314113073130a113000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a323020b000000000013265162650a2650e2651326518265132650e2650a265000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5902000000000000000e6150761500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a023040e1c000000001a4001e554154041d400204541d4001e400194541f4001f400234541f400204001e500204002040020400204001f4001b5001f4001f4001e4001e4001e4000000000000000000000000000
a023020e00000120001a4000d704154041d400157421d4001e4000b7021f4001f400127421f400204001e500204002040020400204001f4001b5001f4001f4001e4001e4001e4000000000000000000000000000
1123020e00000000000d5400d5040d5011554015502155010b5400b5020b501125401250212501204001e500204002040020400204001f4001b5001f4001f4001e4001e4001e4000000000000000000000000000
a11102080000000000134001b05521055260552a0551c500134000e4000a400004000040000400004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 030e0f10
00 4c514344

