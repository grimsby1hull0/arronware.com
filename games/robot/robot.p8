pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
--i♥robot - a robot love story
--by arron ware

-- initialise at beginning
function _init()
 cls(13)
 --play title music
 sfx(00)
 
 --title page
 titlepage=true
 
 startgame=false
 
 car=102
 
 hitman="12"
 
 
 
 --questions
 questions=false
 questions_played=false
 
 
 q_page=nil
 
 q_animal=-1
 q_food=nil
 q_hobby=nil
 

 
 --matchpage
 matching=false
 matching_played=false
 matchcirc=1
 matchlimit=0
 
 
 --intro page
 intro=false
 intro_played=false
 
 -- real one
 --matched page
 matched=false
 matched_played=false
 matchee=nil
 
 matches={
 
		--beeboe
 	["120"]="beeboe",
 	
 	--digby
 	["200"]="digby",
 	["201"]="digby",
 	["202"]="digby",
 	["021"]="digby",
 	["031"]="digby",
 	["111"]="digby",
 	["301"]="digby",
 	["311"]="digby",
 	
 	--robotron
 	["203"]="robotron",
 	["221"]="robotron",
 	["223"]="robotron",
 	["300"]="robotron",
 	["011"]="robotron",
 	
 	--edwerd
 	["002"]="edwerd",
 	["102"]="edwerd",
 	["001"]="edwerd",
 	["001"]="edwerd",
 	
 	
 	
 	--pugsley
 	["132"]="pugsley",
 	["212"]="pugsley",
 	["122"]="pugsley",
 	["312"]="pugsley",
 	["322"]="pugsley",
 	["331"]="pugsley",
 	["123"]="pugsley",
 	
 	
 		--cogbert
 	["210"]="cogbert",
 	["213"]="cogbert",
 	["230"]="cogbert",
 	["220"]="cogbert",
 	["313"]="cogbert",
 	["003"]="cogbert",
 	["013"]="cogbert",
 	["321"]="cogbert",
 	
 	
 	--heath
 	["101"]="heath",
 	["303"]="heath",
 	["302"]="heath",
 	["211"]="heath",
 	["231"]="heath",
 	["131"]="heath",
 	["121"]="heath",
 	["022"]="heath",
 	
 	
 	--bernard
 	["032"]="bernard",
 	["030"]="bernard",
 	["130"]="bernard",
 	["323"]="bernard",
 	["320"]="bernard",
 	["130"]="bernard",
 	["330"]="bernard",
 	["000"]="bernard",
 	["310"]="bernard",
 	
 	
 	--lee
 	["012"]="lee",
 	["133"]="lee",
 	["112"]="lee",
 	["233"]="lee",
 	["110"]="lee",
 	["233"]="lee",
 	["010"]="lee",
 	["020"]="lee",
 	
 	
 	--wendell
 	["113"]="wendell",
 	["033"]="wendell",
 	["023"]="wendell",
 	["333"]="wendell",
 	
 	--arnold
 	["100"]="arnold",
 	["222"]="arnold",
 	["232"]="arnold",
 	["332"]="arnold",
 	["322"]="arnold",
 
 
 }
 
 function get_match(a,f,h)
 	local key=""..a..f..h
 	return matches[key]
 end

  
end
	














		
-->8
-- draw frames
function _draw()
 
--title display
 if titlepage then
 	cls(13)
 	--pink and red bars
		rectfill(0,35,128,30,14)
		rectfill(0,35,128,40,8)
		
		--robots
	 sspr(24, 0, 32, 24, 42, 34)
	 --gas can
	 sspr(57, 0, 7, 8, 55, 24)
	 
	 --title
	 print("i♥robot!",40, 50, 8)
	 print("i♥robot!",41, 51, 9)
	 print("i♥robot!",42, 52, 10)
	 print("i♥robot!",43, 53, 11)
	 print("i♥robot!",44, 54, 12)
	 
	 --div line
	 rectfill(78,60,40,61,9)
	 
	 --subtitle
	 print("a robot love story",
	 24, 63, 14)
	 
	 
	 
	 --play line
	 rectfill(0,85,130,86,9)
	 rectfill(0,87,130,88,10)
	 rectfill(0,89,130,90,14)
	 rectfill(0,89,130,90,14)
	 
	 
	 --menu controls
	 print("c/🅾️ to play!",
	 38, 84, 12)
	 
	 --car
	 sspr(24, 16, 18, 16, car, 75)
	 
	 --hit man
	 sspr(hitman, 16, 14, 16, 10, 79)
	 
	 
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
-- audio
	
	
	--questions audio
	if questions and not 
	questions_played then
		-- stop playing music
  sfx(-1)
  -- start playing new music
  sfx(04)
  questions_played=true
	end
	
	
	--matching audio
	if matching and not 
	matching_played then
		-- stop playing music
  sfx(-1)
  -- start playing new music
  sfx(03)
  matching_played=true
	end
	
	
	
	--intro audio
	if intro and not 
	intro_played then
		-- stop playing music
  sfx(-1)
  -- start playing new music
  sfx(02)
  intro_played=true
	end
	
	
	
	--matched audio
	if matched and not 
	matched_played then
		-- stop playing music
  sfx(-1)
  -- start playing new music
  
  -- !! temp comment !!!!sfx(05)
  
  matched_played=true
	end
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
-- questions display
	if questions then
		cls(2)
		
		
		-- animal page
		if q_page==1 then
			sspr(0, 64, 64, 64, 0, 0, 128, 128)
   print("question time!",20,33,8)
   print("question time!",19,32,7)

			--checklist
			spr(28, 101, 115)
			
			
			
			
			
			-- answers

 		print("lion",51,80,7)
			print("⬆️",55,90,12)
			print("mouse",50,120,7)
			print("⬇️",55,110,12)
			print(" ⬅️",41,100,12)
			print(" dog",25,100,7)
			print("➡️",65,100,12)
			print("cat",75,100,7)



	  --question
	  print("if you could be one",6,45,7)
	  print("of these animals",40,54,9)
			print("which one?",20,63,12)
			
--			-- answers
--			print("lion",51,80,7)
--			print("⬆️",55,90,7)
--			print("mouse",50,120,7)
--			print("⬇️",55,110,7)
--			print(" dog ⬅️",25,100,11)
--			print("➡️ cat",65,100,11)
			
		
		
		
		
		
		
		
		
		-- food page
		elseif q_page==2 then
			sspr(0, 64, 64, 64, 0, 0, 128, 128)
			print("question time!",20,33,8)
   print("question time!",19,32,7)
			
			--checklist
			spr(27, 101, 113)
			spr(28, 109, 115)
		
--			-- title
--			print("question time!",30,20,8)
--			print("question time!",29,20,7)
	  --question
	  print("if you could eat",10,45,14)
	  print("one of these fruits",20,55,9)
			print("which one?",10,65,11)
			
			-- answers
			
			-- banana
			spr(82,54,80)
			print("⬆️",55,90,11)
			-- apple
			spr(80,56,116)
			print("⬇️",55,110,11)
			--lemon
			spr(84,35,98)
			print("⬅️",45,100,11)
			--strawberry
			spr(83,74,98)
			print("➡️",65,100,11)
			
		
		
		
		
		
		
		-- hobby page
		elseif q_page==3 then
			sspr(0, 64, 64, 64, 0, 0, 128, 128)
			print("question time!",20,33,8)
   print("question time!",19,32,7)

			--checklist
			spr(27, 101, 113)
			spr(27, 109, 113)
			spr(28, 117, 115)

--			-- title
--			print("question time!",30,20,8)
--			print("question time!",29,20,7)
   --question
	  print("if you could do",20,45,12)
	  print("one of these activities",10,55,7)
			print("which one?",40,65,8)
			
		-- answers
			
			-- beach
			print("beach",50,83,7)
			print("⬆️",55,90,8)
			-- bicycle
			print("bicycle",47,117,7)
			print("⬇️",55,110,8)
			-- baking
			print(" ⬅️",41,100,8)
			print(" baking",15,100,7)
			-- brewski
			print("➡️",65,100,8)
			print("brewski",75,100,7)
			
			
	
--			
		
		
		end
		
	end
	
	
	
	
	
	
-- matching display
	if matching then
		cls(12)

		if matchcirc<=42 then
			matchcirc+=0.5
		end
		if matchcirc==42 then
			matchlimit+=1
			matchcirc=1
		end
		
		-- main circles
		circ(63,63,matchcirc,7)
		circ(63,63,matchcirc-2,8)
		circ(63,63,matchcirc-3,8)
		--progress circ
		-- circ(63,63,matchcirc,7)
		
		
		
		print('matching ⧗',10,40,8)
		print("please wait...",30,80,7)
	end
	
	
	
	
	-- intro display
	if intro then
		cls(1)
		
		
		print("hope you're not nervous..."
		,10,10,5)
		print('you have been matched',10,40,8)
		print("❎ to reveal!",30,80,7)
	end
	
	
	
	
	
-- matched display
	if matched then 
		cls(14)
		
		
		-- main bg-circs
		circfill(10,20,100,12)
		fillp(♪)
		circfill(10,20,100,15)
		fillp()
		
		circfill(100,108,50,9)
		fillp()
		--bg circ shadows
		circ(10,21,100,13)
		circ(100,109,50,13)
		fillp(0b0011001111001100)
		circ(10,21,98,5)
		fillp()  
		fillp(0b0011001111001100)
		circ(100,109,48,5)
		fillp()  
		
		

		-- main rectangle
		rectfill(8,20,119,100,7)
		--border triangles
		--top
		spr(96,8,12)
		spr(96,16,12)
		spr(96,24,12)
		spr(96,32,12)
		spr(96,40,12)
		spr(96,48,12)
		spr(96,56,12)
		spr(96,64,12)
		spr(96,72,12)
		spr(96,80,12)
		spr(96,88,12)
		spr(96,96,12)
		spr(96,104,12)
		spr(96,112,12)
		--bottom
		spr(97,8,100)
		spr(97,16,100)
		spr(97,24,100)
		spr(97,32,100)
		spr(97,40,100)
		spr(97,48,100)
		spr(97,56,100)
		spr(97,64,100)
		spr(97,72,100)
		spr(97,80,100)
		spr(97,88,100)
		spr(97,96,100)
		spr(97,104,100)
		spr(97,112,100)
		--left
		spr(98,1,20)
		spr(98,1,28)
		spr(98,1,36)
		spr(98,1,44)
		spr(98,1,52)
		spr(98,1,60)
		spr(98,1,68)
		spr(98,1,76)
		spr(98,1,84)
		spr(98,1,92)
		--right
		spr(99,119,20)
		spr(99,119,28)
		spr(99,119,36)
		spr(99,119,44)
		spr(99,119,52)
		spr(99,119,60)
		spr(99,119,68)
		spr(99,119,76)
		spr(99,119,84)
		spr(99,119,92)
		
		--photo bg
		rectfill(29,48,38,39,1)
		
		
		rectfill(6,22,28,22,8)
		rectfill(6,25,28,25,8)
		
		
		
	--		print("❎ to continue",70,120,7)
	print("🅾️ to play again",56,120,7)
	print(matchee,128,128,8)
		
		
		
		
	-- matchee info
	
		--beeboe
		if matched and matchee=="beeboe" then
			--pic
			spr(71,30,40)
			
			--name
			print("beeboe",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("cheese",83,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("paper crafts",43,56,13)
			print("science",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("loud noises",43,76,13)
			print("long walks",43,82,13)		
		
		end
		
		
		-- digby
		if matched and matchee=="digby" then
			--pic
			spr(64,30,40)
			
			--name
			print("digby",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("civil war",83,40,0)
			print("gun collector",69,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("reading the paper",43,56,13)
			print("hunting",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("kids",43,76,13)
			print("nature",43,82,13)		
		
		end
		
		
		-- human robotron
		if matched and matchee=="robotron" then
			--pic
			spr(69,30,40)
			
			--name
			print("robotron",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("i know",83,40,0)
			print("not fun",83,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("nice robots",43,56,13)
			print("industrial music",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("humans",43,76,13)
			print("potatoes",43,82,13)		
		
		end
		
		
		--edwerd
		if matched and matchee=="edwerd" then
			--pic
			spr(68,30,40)
			
			--name
			print("edwerd",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("many year",80,40,0)
			print("scuba diver",76,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("tropical fish",43,56,13)
			print("victoria sponge cake",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("fishermen",43,76,13)
			print("toes",43,82,13)		
		
		end
		
		
		
		--pugsley
		if matched and matchee=="pugsley" then
			--pic
			spr(70,30,40)
			
			--name
			print("pugsley",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves ",83,40,0)
			print("romcoms",83,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("daunting tasks",43,56,13)
			print("fiesty chihuahuas",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("loud noises",43,76,13)
			print("long walks",43,82,13)		
		
		end
		
		--cogbert
		if matched and matchee=="cogbert" then
			--pic
			spr(67,30,40)
			
			--name
			print("cogbert",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("mysteries",83,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("documentaries",43,56,13)
			print("doodling",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("ice cream",43,76,13)
			print("excercise",43,82,13)		
		
		end
		
		
		--heath
		if matched and matchee=="heath" then
			--pic
			spr(15,30,40)
			
			--name
			print("heath",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("conspiracy",80,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("aliens",43,56,13)
			print("weasels",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("social media",43,76,13)
			print("noodles",43,82,13)		
		
		end
		
		
		--bernard
		if matched and matchee=="bernard" then
			--pic
			spr(23,30,40)
			
			--name
			print("bernard",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("museums",80,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("infrastructure",43,56,13)
			print("salads",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("conspiracy",43,76,13)
			print("mushrooms",43,82,13)		
		
		end
		
		
		--lee
		if matched and matchee=="lee" then
			--pic
			spr(24,30,40)
			
			--name
			print("lee",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("travelling",80,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("mocktails",43,56,13)
			print("fashion",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("cars",43,76,13)
			print("sports",43,82,13)		
		
		end
		
		
		--wendell
		if matched and matchee=="wendell" then
			--pic
			spr(25,30,40)
			
			--name
			print("wendell",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("japan",80,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("media history",43,56,13)
			print("sewing",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("hot weather",43,76,13)
			print("sports",43,82,13)		
		
		end
		
		
		--arnold
		if matched and matchee=="arnold" then
			--pic
			spr(26,30,40)
			
			--name
			print("arnold",40,40,0)
			
			--fun fact title
			print("fun fact",80,30,14)
			--fun fact
			print("loves",83,40,0)
			print("noir films",80,46,0)
			
			
			--likes title
			print("likes",40,50,11)
			--likes
			print("old actors",43,56,13)
			print("painting",43,62,13)
			
			--dislikes title
			print("dislikes",40,70,8)
			--dislikes
			print("gardening",43,76,13)
			print("earthquakes",43,82,13)		
		
		end
		
		
		
		
		
	end
	
	
	
	
	
 
	
	
end
-->8
--update 
function _update()
-- title page
 if titlepage and btnp(4)  and not startgame then
 	startgame=true
 	
 	sfx(01)
 	sfx(07)
 	
 	
 		
 end
 
 if startgame then
 
 	
 		
 	car-=2
 	
 	if car <=50 then
 		hitman="42"
 	end
 	
 	if car<=9 then
 		startgame=false
 		titlepage=false
 		questions=true
 		q_page=1
 	end
 
 
 end
 
 if car==9 then
 	sfx(01)
 	titlepage=false
 	questions=true
 end
 
-- -- !!! debugging for matched
-- if titlepage and btnp(5) then
-- 	sfx(01)
-- 	titlepage=false
-- 	matched=true
-- end
 
 
 
 
 
 
 
 

--q_animal page
	if q_page==1 then
		-- lion up
		if q_animal==-1 and btnp(2) then
			sfx(01)
			q_animal=2
			q_page+=1
			
		end
		
		-- mouse down
		if q_animal==-1 and btnp(3) then
			sfx(01)
			q_animal=3
			q_page+=1
			
		end
		
		-- dog left
		if q_animal==-1 and btnp(0) then
			sfx(01)
			q_animal=0
			q_page+=1
			
		end
		
		-- cat right
		if q_animal==-1 and btnp(1) then
			sfx(01)
			q_animal=1
			q_page+=1
			
		end
	

 
 
 
 
 
 
 
 
--q_food page

	elseif q_page==2 then
		-- banana up
		if btnp(2) then
			sfx(01)
			q_food=2
			q_page+=1
			
		end
		
		-- apple down
		if btnp(3) then
			sfx(01)
			q_food=3
			q_page+=1
			
		end
		
		-- lemon left
		if btnp(0) then
			sfx(01)
			q_food=0
			q_page+=1
			
		end
		
		-- strawberry right
		if btnp(1) then
			sfx(01)
			q_food=1
			q_page+=1
			
		end
	



	
	
	
	
	-- hobby page
	elseif q_page==3 then
		
		-- beach up
		if btnp(2) then
			sfx(01)
			q_hobby=2
			q_page+=1
			
		end
		
		-- bike down
		if btnp(3) then
			sfx(01)
			q_hobby=3
			q_page+=1
			
		end
		
		-- lemon left
		if btnp(0) then
			sfx(01)
			q_hobby=0
			q_page+=1
			
		end
		
		-- strawberry right
		if btnp(1) then
			sfx(01)
			q_hobby=1
			q_page+=1
			
		end
		
	elseif q_page==4 then
		
		matching=true
		
		if not matchee then
			-- let matching begin!
			
			-- this is where 
			-- the old code lived
			matchee=get_match(q_animal,q_food,q_hobby)
			
			
			
			
		
		
		end
		
		
 end
 
	
	if matched and btnp(4) then 
		_init()
	end
	
	
	
	
	-- matching page
 if matchlimit==3 then
 	matching=false
 	intro=true
 	
 	
 end
	
	
	
 
 
 
-- intro page 
 if intro and btnp(5) then
 	intro=false
 	matched=true
 end
 

 
 
end
__gfx__
00000000000006666660000000000666660000000000006666600000000000000000044005555550000000000777777000000000000444400666666044444444
000000000000066666600000000006666600000000000066666000000000555004446a6055555555007777007446644700000000004467400dd6666046666660
00700700000006c66c600000000006c66c000000000000c66c6000000558805006c6acaa511ff11500c77c0076c66c67000050000447657406666dd043bb63b0
000770000000066666600000000006666600000000000066666000000088850046666a6a5f5ff5f5000330006666666600555500f0ee6ee406c66c6066666660
00077000000006666660000000000666660000000000006666600000008880000464464a0ffffff0066336600664466000577500f00666000666666056666666
007007000000dddddddd00000000ddddddd0000000000ddddddd000000888000064664600d6666d0600330060645546000555500fff888ff086666800d66d600
000000000066dddddddd66000066ddddddd6000000006ddddddd66000000000006666660966776690067760006466460066dd6600008880ff665566f00d66660
000000000099d111111d99000099d1111119000000009111111d99000000000000044000aaa55aaa0440044000dddd00000dd0000008880fff9999ff00005000
000000000066d153531d66000066d1535316000000006153531d6600444460000000000040404440002222000000000000000000000000000000000000000000
000000000099d135351d99000099d1353519000000009135351d99004663b0000446644004444644022222200000000000000000000000000000000000000000
000000000066d111111d66000066d1111116000000006111111d66004666660063bdd3b0444666600656d6500000008000000000000000000000000000000000
000000000000dddddddd00000000ddddddd0000000000ddddddd000044666600633ddd3046b36b30d5b565b50000088800088000000000000000000000000000
0000000000000660066000000000066006000000000000600660000004666600066d5dd046666660065666560080888000088000000000000000000000000000
0000000000000550055000000000055005000000000000500550000000622000886d55d0066ddd00066666660888880000000000000000000000000000000000
0000000000000660066000000000066006000000000000600660000001170710988666002d6660000666dd000088800000000000000000000000000000000000
00000000000005500550000000000550050000000000005005500000011707118988600022992200e9eee9e00008000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000050000000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000505000000000000000000000000000005050000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000050000000000000000000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000006c6c00000000000006666700000000006666000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000666600000000000033336f77000000006c6c000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000066660000000000003b336fff700000006666000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000d1111d0000000000033336ffff10000dd1111dd0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000d1331d0000000000033b36ff5100000d018810d0000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000001111000000000000bb366550000000001111000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000d00d0000000000006966500000000000d00d000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000600600000000000222222200000000006006000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000026112226112000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000021512521512000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000001110001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000440055555500000000007777770000000000004444066666666000000000000000000000000000000000000000000000000000000000000000000000000
04446a6055555555007777007446644700000000004467406dd66666004444000000000000000000000000000000000000000000000000000000000000000000
06c6acaa511ff11500c77c0076c66c67000050000447657466666dd6044664400000000000000000000000000000000000000000000000000000000000000000
46666a6a5f5ff5f5000330006666666600555500f0ee6ee466c66c6604c66c400000000000000000000000000000000000000000000000000000000000000000
0464464a0ffffff0066336600664466000577500f006660066666666446666400000000000000000000000000000000000000000000000000000000000000000
064664600d6666d0600330060645546000555500fff888ff686666864ee00e440000000000000000000000000000000000000000000000000000000000000000
06666660a667766a0067760006466460066dd6600008880f6665566605eeee500000000000000000000000000000000000000000000000000000000000000000
00044000aaaaaaaa0440044000dddd00000dd0000008880f6666666606eeee600000000000000000000000000000000000000000000000000000000000000000
00000000000330000000000000000000000300000000000000044000000040000000000000000000000000000000000000000000000000000000000000000000
0bb00000003bb3000000700003303300000a40000000000000bb0000000400000000000000000000000000000000000000000000000000000000000000000000
00040000003bb300000070000083800000a43a00001555000b880000099999900000000000000000000000000000000000000000000000000000000000000000
0884800003bbbb30000a70000988880000aaaa0001155110b858000099a99a990000000000000000000000000000000000000000000000000000000000000000
0888880003b44b3000a0aa000889890000aaaa0001111110b888000099a99a990000000000000000000000000000000000000000000000000000000000000000
0888880003b44b30000aa0a00988880000aaaa0001111110b5880000999999990000000000000000000000000000000000000000000000000000000000000000
0088880003bbbb30004a000000889000000aa000011111100b858000099aa9900000000000000000000000000000000000000000000000000000000000000000
00000000003333000000000000988000000000000011110000bbb000009999000000000000000000000000000000000000000000000000000000000000000000
00000000777777770000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000770000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700000000000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07777770000000000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777000000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff44444444444444444444fff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff411111111111111111145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff411111111111818181145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff41a011666118181818145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff410a16161111111115145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff41a011113111111115145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff410a11133311151515145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff41a011114111555555145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff430a31333311555555145ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff4cccc3cccc335555d5c45ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff4c33ccc33cccccccccc45ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff444444444444444444445ff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffff555555555555555555555ff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffffffff8ffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffff8f3343ffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffffffff3384fffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffff3ffeffff8433ffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffffbcffff334f38fffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffff57ffffffeeff8fffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffff977ffffffeeefffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffff777f7ffeeefffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffffff7777fffeeefffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffff67f67ffffeefffffffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffff4444444444444444fffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffff4444444444444444fffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffff22ffffffffffff44fffff0000000000000000000000000000000000000000000000000000000000000000
fffffffffffffffffffffffffffffffffffffffffff42ffffffffffff24fffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffff4fffffffffffff2fffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444777777777777740000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444766676667666740000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444767676767676740000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444766676667666740000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444777777777777740000000000000000000000000000000000000000000000000000000000000000
44444444444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000
__label__
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd555ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddddddddddd5588d5ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddd8885dd4ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddd888ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddd888ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee66666eeeeeeeeeeee66666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
88888888888888888888888888888888888888888888888666668888888888886666688888888888888888888888888888888888888888888888888888888888
888888888888888888888888888888888888888888888886c66c888888888888c66c688888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888666668888888888886666688888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888666668888888888886666688888888888888888888888888888888888888888888888888888888888
8888888888888888888888888888888888888888888888ddddddd8888888888ddddddd8888888888888888888888888888888888888888888888888888888888
8888888888888888888888888888888888888888888866ddddddd6888888886ddddddd6688888888888888888888888888888888888888888888888888888888
dddddddddddddddddddddddddddddddddddddddddddd99d1111119dddddddd9111111d99dddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddd66d1535316dddddddd6153531d66dddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddd99d1353519dddddddd9135351d99dddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddd66d1111116dddddddd6111111d66dddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddd66dd6dddddddddddd6dd66ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddd55dd5dddddddddddd5dd55ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddd66dd6dddddddddddd6dd66ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddddd55dd5dddddddddddd5dd55ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddd888dd88d88dd888dd88d888dd88d888dd8dddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddd999d899899d89998d9989998d99d999d89ddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddd8aaa89aa9aa89aaa98aa9aaa98aa8aaa89adddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddd89bbb9abbabb9abbba9bbabbba9bb9bbb9abddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddd889acccabccbccabcccbaccbcccbaccacccabcdddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddd99abcddbcccccabc9cbcbcbc9cbcbcabc9dbcdddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddaabcdd3cccccabccabcbcbccabcbcabcdadcdddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddbbcdd33cccddbcbcbcdcbcbcbcdcdbcddbddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddddddddddddddddcccddddcddddcdcdccddcccdccdddcdddcdddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddd999999999999999999999999999999999999999ddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddd999999999999999999999999999999999999999ddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddeeedddddeeeddeedeeeddeedeeedddddeddddeedededeeeddddddeedeeeddeedeeedededdddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddededddddededededededededdeddddddedddedededededddddddeddddeddededededededdddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddeeedddddeeddededeeddededdeddddddedddededededeeddddddeeeddeddededeeddeeeddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddededddddededededededededdeddddddedddededeeededddddddddeddeddededededddeddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddededddddededeeddeeedeedddeddddddeeedeedddeddeeedddddeedddeddeeddededeeeddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddcccccddddddcccddccdddddcccdcdddcccdcdcddcdddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddccdddccddddddcddcdcdddddcdcdcdddcdcdcdcddcdddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddccdcdccddddddcddcdcdddddcccdcdddcccdcccddcdddddddddddddddddddddddddddddddddddddddddddddddddddddddd
ddddddddddddddddddddddddddddddccdddccddddddcddcdcdddddcdddcdddcdcdddcddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddcccccdddddddcddccddddddcdddcccdcdcdcccddcdddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

__sfx__
001401202457024162260511c171084703a7402c75020740147400ab741097332a422ca5224a6228a6336a5412b76343500f17116460220522e043081733a0633e0533e0443e043340421a0703eb7624b750eb72
001000001d7000087734b1638b0728301223011c3011ea0518a051e2001ab043080728b0622b061eb063c30116001200012e0022400124807240001a3000230134b032a3031e30018b040cb040cb031830000000
0013010f1250012570145701b570145700d5700b5700d570105700967006570106700657008670065700000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c011a3aa0332a7404b1600061300031c3221a8441ab6722a261eb57168440006002b34200711602022b241684302012380732a8572035002966088150cb7436370180410e86632b360c16422313263703eb55
0010011811050000001e0700000000000000000000020070000001207000000087701177000000085700370000000045700000000000195700000000000000000000000000000000000000000000000000000000
00100120000000000027050000001d05000000110500000000000350200000034020000002e02035020000003a0200000034020000002c02000000000002f02000000350200000031020000002b0502805024050
00100120000001b0001c05029050180001c0501805015050130501205017000190003505018050190501b0501d05021050240502e0501b050170501205014050170501d050240500e0501005011050170501b050
00070000116000a6000a6000f60016600146001265015650176501a6501c6501a6501c6501e65024650226502a6502e6502e6502e65031650366503365034650376503c6502c6502565024650313502c35028350
