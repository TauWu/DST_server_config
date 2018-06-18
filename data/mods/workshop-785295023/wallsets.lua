local Vector3=GLOBAL.Vector3
local AddWallSet=GLOBAL.SuperWall.AddWallSet



AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-3,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="fence", offset=Vector3(-4,0,0), height=4, rotation=90, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-5,0,-1), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-4), height=4, rotation=0, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,-5), height=2, },
	{ walltype="fence", offset=Vector3(-4,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-3,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,-5), height=4, rotation=90, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="fence", offset=Vector3(0,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-1), height=4, rotation=0, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="fencegate", offset=Vector3(-3,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-4,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-6,0,0), height=4, rotation=90, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-7,0,-1), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-5), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-6), height=4, rotation=0, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,-7), height=2, },
	{ walltype="fence", offset=Vector3(-6,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-5,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-4,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-3,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,-7), height=4, rotation=90, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-7), height=2, },
	{ walltype="fence", offset=Vector3(0,0,-6), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-5), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-1), height=4, rotation=0, },
})

AddWallSet({
	names={EN="Smart Fence",CHS="智能栅栏",CHT="智能柵欄",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="fence", size={x=15,y=15,}, offset=Vector3(0,0,0), height=4, },
})

AddWallSet({
	names={EN="Smart Fence",CHS="智能栅栏",CHT="智能柵欄",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=2, walltype2="fence", height2=4, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fencegate", offset=Vector3(-1,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="fence", offset=Vector3(0,0,0), height=4, rotation=90, },
	{ walltype="fencegate", offset=Vector3(-1,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="fence", offset=Vector3(-3,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Gate 4x4",CHS="大门 4x4",CHT="大門 4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="fencegate", offset=Vector3(-1,0,-2), height=4, rotation=315, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,-1), height=4, rotation=315, isswingright=true,},
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 4x4",CHS="大门 4x4",CHT="大門 4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=135, },
	{ walltype="fencegate", offset=Vector3(-1,0,-2), height=4, rotation=315, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,-1), height=4, rotation=315, isswingright=true,},
	{ walltype="fence", offset=Vector3(-3,0,0), height=4, rotation=135, },
})

AddWallSet({
	names={EN="Fence 1x3",CHS="栅栏1x3",CHT="柵欄1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Fence 1x3",CHS="栅栏1x3",CHT="柵欄1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="fence", offset=Vector3(0,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Fence 3x3",CHS="栅栏3x3",CHT="柵欄3x3",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,-1), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=135, },
})

AddWallSet({
	names={EN="Fence 3x3",CHS="栅栏3x3",CHT="柵欄3x3",},
	pivot=Vector3(-1,0,-1),
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-1,0,-1), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=135, },
})

--==============================================================================================

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-3,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="fence", offset=Vector3(-4,0,0), height=4, rotation=90, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-5,0,-1), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-5,0,-4), height=4, rotation=0, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,-5), height=2, },
	{ walltype="fence", offset=Vector3(-4,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-3,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,-5), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,-5), height=4, rotation=90, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="fence", offset=Vector3(0,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-1), height=4, rotation=0, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="fencegate", offset=Vector3(-3,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-4,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-6,0,0), height=4, rotation=90, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-7,0,-1), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-5), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(-7,0,-6), height=4, rotation=0, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,-7), height=2, },
	{ walltype="fence", offset=Vector3(-6,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-5,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-4,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-3,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,-7), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,-7), height=4, rotation=90, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-7), height=2, },
	{ walltype="fence", offset=Vector3(0,0,-6), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-5), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-4), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=0, },
	{ walltype="fence", offset=Vector3(0,0,-1), height=4, rotation=0, },
})

AddWallSet({
	names={EN="Smart Fence",CHS="智能栅栏",CHT="智能柵欄",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="fence", size={x=15,y=15,}, offset=Vector3(0,0,0), height=4, },
})

AddWallSet({
	names={EN="Smart Fence",CHS="智能栅栏",CHT="智能柵欄",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="woodwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=2, walltype2="fence", height2=4, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fencegate", offset=Vector3(-1,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="woodwall", offset=Vector3(-3,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="fence", offset=Vector3(0,0,0), height=4, rotation=90, },
	{ walltype="fencegate", offset=Vector3(-1,0,0), height=4, rotation=270, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,0), height=4, rotation=270, isswingright=true,},
	{ walltype="fence", offset=Vector3(-3,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Gate 4x4",CHS="大门 4x4",CHT="大門 4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="woodwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="fencegate", offset=Vector3(-1,0,-2), height=4, rotation=315, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,-1), height=4, rotation=315, isswingright=true,},
	{ walltype="woodwall", offset=Vector3(-3,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 4x4",CHS="大门 4x4",CHT="大門 4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="fence", offset=Vector3(0,0,-3), height=4, rotation=135, },
	{ walltype="fencegate", offset=Vector3(-1,0,-2), height=4, rotation=315, isswingright=false,},
	{ walltype="fencegate", offset=Vector3(-2,0,-1), height=4, rotation=315, isswingright=true,},
	{ walltype="fence", offset=Vector3(-3,0,0), height=4, rotation=135, },
})

AddWallSet({
	names={EN="Fence 1x3",CHS="栅栏1x3",CHT="柵欄1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Fence 1x3",CHS="栅栏1x3",CHT="柵欄1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="fence", offset=Vector3(0,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-1,0,0), height=4, rotation=90, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=90, },
})

AddWallSet({
	names={EN="Fence 3x3",CHS="栅栏3x3",CHT="柵欄3x3",},
	pivot=Vector3(-1,0,-1),
	{ walltype="woodwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="fence", offset=Vector3(-1,0,-1), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=135, },
})

AddWallSet({
	names={EN="Fence 3x3",CHS="栅栏3x3",CHT="柵欄3x3",},
	pivot=Vector3(-1,0,-1),
	{ walltype="fence", offset=Vector3(0,0,-2), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-1,0,-1), height=4, rotation=135, },
	{ walltype="fence", offset=Vector3(-2,0,0), height=4, rotation=135, },
})

--==============================================================================================

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-4), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-5), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-6,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-6), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,-7), height=3, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-7), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-7), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-6), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

--==============================================================================================

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-4), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-5,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(-4,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-5), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-6,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-7,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-7,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-7,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-7,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-7,0,-6), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-7,0,-7), height=3, },
	{ walltype="stonewall", offset=Vector3(-6,0,-7), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-7), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,-7), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-7), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-7), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-7), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-4), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-5), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-6,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-6), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,-7), height=3, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-7), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-7), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-6), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-4,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="haywall", offset=Vector3(-5,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(-5,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(-5,0,-4), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-5,0,-5), height=3, },
	{ walltype="haywall", offset=Vector3(-4,0,-5), height=2, },
	{ walltype="haywall", offset=Vector3(-3,0,-5), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,-5), height=2, },
	{ walltype="haywall", offset=Vector3(-1,0,-5), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="haywall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-6,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-7,0,-1), height=2, },
	{ walltype="haywall", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(-7,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(-7,0,-4), height=2, },
	{ walltype="haywall", offset=Vector3(-7,0,-5), height=2, },
	{ walltype="haywall", offset=Vector3(-7,0,-6), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-7,0,-7), height=3, },
	{ walltype="haywall", offset=Vector3(-6,0,-7), height=2, },
	{ walltype="haywall", offset=Vector3(-5,0,-7), height=2, },
	{ walltype="haywall", offset=Vector3(-4,0,-7), height=2, },
	{ walltype="haywall", offset=Vector3(-3,0,-7), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="haywall", offset=Vector3(-1,0,-7), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-7), height=3, },
	{ walltype="haywall", offset=Vector3(0,0,-6), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 6x6",CHS="小房间6x6",CHT="小房間6x6",},
	pivot=Vector3(-2,0,-2),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-4), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-5,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(-4,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-5), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Cell 8x8",CHS="小房间8x8",CHT="小房間8x8",},
	pivot=Vector3(-3,0,-3),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-6,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-7,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(-7,0,-6), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-7,0,-7), height=3, },
	{ walltype="ruinwall", offset=Vector3(-6,0,-7), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-7), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,-7), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,-7), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-7), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-7), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-6), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="woodwall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="woodwall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="woodwall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="woodwall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="woodwall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="haywall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="haywall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="woodwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="haywall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="woodwall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="haywall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="haywall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="woodwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="haywall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="haywall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="haywall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-6,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-7,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-8,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-9,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-15,0,-6), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-15,0,-7), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-15,0,-8), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-15,0,-9), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-9,0,-15), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-8,0,-15), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-7,0,-15), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-6,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="limestonedoor", offset=Vector3(0,0,-9), height=2, },
	{ walltype="limestonedoor", offset=Vector3(0,0,-8), height=2, },
	{ walltype="limestonedoor", offset=Vector3(0,0,-7), height=2, },
	{ walltype="limestonedoor", offset=Vector3(0,0,-6), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-2), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-2), height=3, },
	{ walltype="stonewall", offset=Vector3(-10,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(-14,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-9), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-10), height=3, },
	{ walltype="stonewall", offset=Vector3(-14,0,-10), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="stonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-10,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-13), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-13), height=3, },
	{ walltype="stonewall", offset=Vector3(-5,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,-10), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-2), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-2), height=3, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-9), height=2, },
	{ walltype="stonewall", offset=Vector3(-13,0,-10), height=3, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-10), height=2, },
	{ walltype="stonewall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="stonewall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(-10,0,-13), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-13), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-13), height=3, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-14), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="stonewall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-10), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-6), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-5), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Base 16x16",CHS="基地16x16",CHT="基地16x16",},
	pivot=Vector3(-7,0,-7),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-2), height=3, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-2), height=2, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-2), height=3, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-11,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-14,0,0), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-1), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(-14,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,-5), height=3, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-6), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-13,0,-9), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,-10), height=3, },
	{ walltype="ruinwall", offset=Vector3(-14,0,-10), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-10), height=3, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(-15,0,-14), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(-15,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-14,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-13,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-12,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-11,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-14), height=2, },
	{ walltype="ruinwall", offset=Vector3(-10,0,-13), height=3, },
	{ walltype="wooddoor", offset=Vector3(-9,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-8,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-7,0,-13), height=2, },
	{ walltype="wooddoor", offset=Vector3(-6,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-13), height=3, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-14), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(-4,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-15), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-15), height=2, },
	
	{ walltype="ruinwall", offset=Vector3(0,0,-15), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-14), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-13), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-12), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-11), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-10), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-10), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-10), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-9), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-8), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-7), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,-6), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,-5), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-5), height=3, },
	{ walltype="ruinwall", offset=Vector3(0,0,-4), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-3), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="ruinwall", offset=Vector3(0,0,-1), height=2, },
})



AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x5",CHS="大门 1x5",CHT="大門 1x5",},
	pivot=Vector3(-2,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x6",CHS="大门 1x6",CHT="大門 1x6",},
	pivot=Vector3(-2,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=3, },
})

AddWallSet({
	names={EN="Stone Wall 1x3",CHS="石墙1x3",CHT="石牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Stone Wall 1x3",CHS="石墙1x3",CHT="石牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Stone Wall 1x7",CHS="石墙1x7",CHT="石牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-6,0,0), height=2, },
})

AddWallSet({
	names={EN="Mixed Wall 1x3",CHS="混合墙1x3",CHT="混合牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Limestone Wall 1x3",CHS="石灰石墙1x3",CHT="石灰石牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="limestonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Limestone Wall 1x7",CHS="石灰石墙1x7",CHT="石灰石牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="limestonewall", offset=Vector3(0,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-6,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 3x6",CHS="大门 3x6",CHT="大門 3x6",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(1,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,0), height=4, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(-3,0,0), height=4, },
	{ walltype="woodwall", offset=Vector3(-4,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-1), height=2, },
	{ walltype="woodwall", offset=Vector3(-3,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(-3,0,-1), height=2, },
})

AddWallSet({
	names={EN="Gate 3x7",CHS="大门 3x7",CHT="大門 3x7",},
	pivot=Vector3(-2,0,0),
	{ walltype="woodwall", offset=Vector3(1,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,0), height=4, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(-4,0,0), height=4, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-1), height=2, },
	{ walltype="woodwall", offset=Vector3(-4,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(-4,0,-1), height=2, },
})

AddWallSet({
	names={EN="Gate 3x8",CHS="大门 3x8",CHT="大門 3x8",},
	pivot=Vector3(-2,0,0),
	{ walltype="woodwall", offset=Vector3(1,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,0), height=4, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=4, },
	{ walltype="woodwall", offset=Vector3(-6,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(0,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(0,0,-1), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,1), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,-1), height=2, },
})

AddWallSet({
	names={EN="Wood Wall 1x3",CHS="木墙1x3",CHT="木牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="woodwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Wood Wall 1x3",CHS="木墙1x3",CHT="木牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Wood Wall 1x7",CHS="木墙1x7",CHT="木牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="woodwall", offset=Vector3(-6,0,0), height=2, },
})

AddWallSet({
	names={EN="Mixed Wall 1x3",CHS="混合墙1x3",CHT="混合牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Hay Wall 1x3",CHS="草墙1x3",CHT="草牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="haywall", offset=Vector3(0,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Hay Wall 1x7",CHS="草墙1x7",CHT="草牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="haywall", offset=Vector3(0,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="haywall", offset=Vector3(-6,0,0), height=2, },
})

AddWallSet({
	names={EN="Mixed Wall 1x3",CHS="混合墙1x3",CHT="混合牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="woodwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x5",CHS="大门 1x5",CHT="大門 1x5",},
	pivot=Vector3(-2,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x6",CHS="大门 1x6",CHT="大門 1x6",},
	pivot=Vector3(-2,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="wooddoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x4",CHS="大门 1x4",CHT="大門 1x4",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x5",CHS="大门 1x5",CHT="大門 1x5",},
	pivot=Vector3(-2,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=3, },
})

AddWallSet({
	names={EN="Gate 1x6",CHS="大门 1x6",CHT="大門 1x6",},
	pivot=Vector3(-2,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonedoor", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-3,0,0), height=2, },
	{ walltype="limestonedoor", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=3, },
})

AddWallSet({
	names={EN="Ruins Wall 1x3",CHS="铥矿墙1x3",CHT="圖勒牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Ruins Wall 1x3",CHS="铥矿墙1x3",CHT="圖勒牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Ruins Wall 1x7",CHS="铥矿墙1x7",CHT="圖勒牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="ruinwall", offset=Vector3(-6,0,0), height=2, },
})

AddWallSet({
	names={EN="Mixed Wall 1x3",CHS="混合墙1x3",CHT="混合牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Mixed Wall 1x3",CHS="混合墙1x3",CHT="混合牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="ruinwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Moon Rock Wall 1x3",CHS="月石墙1x3",CHT="月石牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="moonrockwall", offset=Vector3(0,0,0), height=3, },
	{ walltype="moonrockwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Moon Rock Wall 1x3",CHS="月石墙1x3",CHT="月石牆1x3",},
	pivot=Vector3(-1,0,0),
	{ walltype="moonrockwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-2,0,0), height=2, },
})

AddWallSet({
	names={EN="Moon Rock Wall 1x7",CHS="月石墙1x7",CHT="月石牆1x7",},
	pivot=Vector3(-3,0,0),
	{ walltype="moonrockwall", offset=Vector3(0,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-3,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-4,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-5,0,0), height=2, },
	{ walltype="moonrockwall", offset=Vector3(-6,0,0), height=2, },
})





AddWallSet({
	names={EN="Maze Cell 4x4",CHS="迷宫单元4x4",CHT="迷宮單元4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-3,0,-1), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(-2,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Maze Cell 4x4",CHS="迷宫单元4x4",CHT="迷宮單元4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-1), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(-2,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(0,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Maze Cell 4x4",CHS="迷宫单元4x4",CHT="迷宮單元4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	{ walltype="stonewall", offset=Vector3(-1,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-1), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(-2,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=3, },
	-- { walltype="wooddoor", offset=Vector3(0,0,-2), height=2, },
	-- { walltype="wooddoor", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Maze Cell 4x4",CHS="迷宫单元4x4",CHT="迷宮單元4x4",},
	pivot=Vector3(-1,0,-1),
	{ walltype="stonewall", offset=Vector3(0,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-1,0,0), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-2,0,0), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-1), height=2, },
	-- { walltype="wooddoor", offset=Vector3(-3,0,-2), height=2, },
	{ walltype="stonewall", offset=Vector3(-3,0,-3), height=3, },
	{ walltype="stonewall", offset=Vector3(-2,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(-1,0,-3), height=2, },
	{ walltype="stonewall", offset=Vector3(0,0,-3), height=3, },
	-- { walltype="wooddoor", offset=Vector3(0,0,-2), height=2, },
	-- { walltype="wooddoor", offset=Vector3(0,0,-1), height=2, },
})

AddWallSet({
	names={EN="Mini Maze",CHS="小迷宫",CHT="小迷宮",},
	pivot=Vector3(-10,0,-10),
	{ walltype="limestonewall", offset=Vector3(0,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-1,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-19,0,0), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,0), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-1), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-1), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-1), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-1), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-2), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-2), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-3), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-3), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-3), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-3), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-3), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-4), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-4), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-5), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-5), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-5), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-5), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-19,0,-6), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-6), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-7), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-7), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-7), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-7), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-7), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-7), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-8), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-8), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-9), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-9), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-10), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-10), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-11), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-11), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-11), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-11), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-11), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-11), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-12), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-12), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-13), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-13), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-14), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-14), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-15), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-15), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-9,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-16), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-16), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-17), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-17), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-17), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-17), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-17), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-18), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-18), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-19), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-19), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-19), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-19), height=1, },
	
	{ walltype="limestonewall", offset=Vector3(0,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-1,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-2,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-3,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-4,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-5,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-6,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-7,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-8,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-10,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-11,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-12,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-13,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-14,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-15,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-16,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-17,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-18,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-19,0,-20), height=1, },
	{ walltype="limestonewall", offset=Vector3(-20,0,-20), height=1, },

})







AddWallSet({
	names={EN="Smart Hay Wall",CHS="智能草墙",CHT="智能草牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="haywall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="woodwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="haywall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="haywall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="limestonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="haywall", height2=2, },
})

AddWallSet({
	names={EN="Smart Hay Door",CHS="智能草门",CHT="智能草門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="haydoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})



AddWallSet({
	names={EN="Smart Wood Wall",CHS="智能木墙",CHT="智能木牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="woodwall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="woodwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="woodwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="woodwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="limestonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="woodwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Wood Door",CHS="智能木门",CHT="智能木門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="wooddoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})



AddWallSet({
	names={EN="Smart Stone Wall",CHS="智能石墙",CHT="智能石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Stone Wall",CHS="智能石墙",CHT="智能石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="stonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruinwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="stonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Stone Door",CHS="智能石门",CHT="智能石門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonedoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})



AddWallSet({
	names={EN="Smart Ruins Wall",CHS="智能铥矿墙",CHT="智能圖勒牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruinwall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Ruins Wall",CHS="智能铥矿墙",CHT="智能圖勒牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruinwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="ruinwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Ruins Door",CHS="智能铥矿门",CHT="智能圖勒門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruindoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})



AddWallSet({
	names={EN="Smart Limestone Wall",CHS="智能石灰石墙",CHT="智能石灰石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="limestonewall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Limestone Wall",CHS="智能石灰石墙",CHT="智能石灰石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="limestonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="limestonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="woodwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="limestonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="stonewall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="limestonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruinwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="limestonewall", height2=2, },
})

AddWallSet({
	names={EN="Smart Limestone Door",CHS="智能石灰石门",CHT="智能石灰石門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="limestonedoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})



AddWallSet({
	names={EN="Smart Moon Rock Wall",CHS="智能月石墙",CHT="智能月石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="moonrockwall", size={x=13,y=13,}, offset=Vector3(0,0,0), height=2, },
})

AddWallSet({
	names={EN="Smart Moon Rock Wall",CHS="智能月石墙",CHT="智能月石牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="moonrockwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="moonrockwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Mixed Wall",CHS="智能混合墙",CHT="智能混合牆",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="ruinwall", size={x=15,y=15,}, offset=Vector3(0,0,0), height=3, walltype2="moonrockwall", height2=2, },
})

AddWallSet({
	names={EN="Smart Moon Rock Door",CHS="智能月石门",CHT="智能月石門",},
	descriptions={EN="It will extend automatically when near other super walls!",CHS="当它靠近其他超级墙时会自动延长！",CHT="當它靠近其他超級墻時會自動延長！",},
	smartbuilder={ walltype="moonrockdoor", size={x=9,y=9,}, offset=Vector3(0,0,0), height=2, },
})





AddWallSet({
	names={EN="Height Brush 1x1 (+1)",CHS="高度刷1x1 (+1)",CHT="高度刷1x1 (+1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=1,y=1,}, offset=Vector3(0,0,0), delta=1, },
})

AddWallSet({
	names={EN="Height Brush 1x1 (-1)",CHS="高度刷1x1 (-1)",CHT="高度刷1x1 (-1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=1,y=1,}, offset=Vector3(0,0,0), delta=-1, },
})

AddWallSet({
	names={EN="Height Brush 3x3 (+1)",CHS="高度刷3x3 (+1)",CHT="高度刷3x3 (+1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=3,y=3,}, offset=Vector3(0,0,0), delta=1, },
})

AddWallSet({
	names={EN="Height Brush 3x3 (-1)",CHS="高度刷3x3 (-1)",CHT="高度刷3x3 (-1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=3,y=3,}, offset=Vector3(0,0,0), delta=-1, },
})

AddWallSet({
	names={EN="Height Brush 5x5 (+1)",CHS="高度刷5x5 (+1)",CHT="高度刷5x5 (+1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=5,y=5,}, offset=Vector3(0,0,0), delta=1, },
})

AddWallSet({
	names={EN="Height Brush 5x5 (-1)",CHS="高度刷5x5 (-1)",CHT="高度刷5x5 (-1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=5,y=5,}, offset=Vector3(0,0,0), delta=-1, },
})

AddWallSet({
	names={EN="Height Brush 1x5 (+1)",CHS="高度刷1x5 (+1)",CHT="高度刷1x5 (+1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=1,y=5,}, offset=Vector3(0,0,-2), delta=1, },
})

AddWallSet({
	names={EN="Height Brush 1x5 (-1)",CHS="高度刷1x5 (-1)",CHT="高度刷1x5 (-1)",},
	descriptions={EN="Change the height for super walls and doors!",CHS="改变超级墙的高度！",CHT="改變超級牆的高度！",},
	heightbrush={ size={x=1,y=5,}, offset=Vector3(0,0,-2), delta=-1, },
})




AddWallSet({
	names={EN="Wall Destroyer Brush 1x1",CHS="拆除刷1x1",CHT="拆除刷1x1",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=1,y=1,}, offset=Vector3(0,0,0), },
})

AddWallSet({
	names={EN="Wall Destroyer Brush 3x3",CHS="拆除刷3x3",CHT="拆除刷3x3",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=3,y=3,}, offset=Vector3(0,0,0), },
})

AddWallSet({
	names={EN="Wall Destroyer Brush 5x5",CHS="拆除刷5x5",CHT="拆除刷5x5",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=5,y=5,}, offset=Vector3(0,0,0), },
})

AddWallSet({
	names={EN="Wall Destroyer Brush 9x9",CHS="拆除刷9x9",CHT="拆除刷9x9",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=9,y=9,}, offset=Vector3(0,0,0), },
})

AddWallSet({
	names={EN="Wall Destroyer Brush 1x5",CHS="拆除刷1x5",CHT="拆除刷1x5",},
	descriptions={EN="Super walls and doors in the rect will be destroyed!",CHS="区域内的超级墙和门将被摧毁！",CHT="區域內的超級牆和門將被摧毀！",},
	destroyer={ size={x=1,y=5,}, offset=Vector3(0,0,-2), },
})









-- AddWallSet({
	-- names={EN="test",CHS="测试",CHT="测试",},
	-- pivot=Vector3(0,0,0),
	-- { walltype="stonewall", offset=Vector3(0,0,0), height=4, },
	-- { walltype="wooddoor", offset=Vector3(1,0,0), height=4, },
	-- { walltype="wooddoor", offset=Vector3(2,0,0), height=3, },
	-- { walltype="wooddoor", offset=Vector3(3,0,0), height=2, },
	-- { walltype="wooddoor", offset=Vector3(4,0,0), height=1, },
	-- { walltype="wooddoor", offset=Vector3(-1,0,0), height=4, },
	-- { walltype="stonedoor", offset=Vector3(-2,0,0), height=4, },
	-- { walltype="haydoor", offset=Vector3(-3,0,0), height=4, },
	-- { walltype="ruindoor", offset=Vector3(-4,0,0), height=4, },
	-- { walltype="limestonedoor", offset=Vector3(-5,0,0), height=4, },
	-- { walltype="moonrockdoor", offset=Vector3(-6,0,0), height=4, },
	-- { walltype="woodwall", offset=Vector3(0,0,1), height=4, },
	-- { walltype="haywall", offset=Vector3(0,0,2), height=4, },
	-- { walltype="limestonewall", offset=Vector3(0,0,3), height=4, },
	-- { walltype="ruinwall", offset=Vector3(0,0,4), height=4, },
	-- { walltype="moonrockwall", offset=Vector3(0,0,5), height=4, },
	
-- })