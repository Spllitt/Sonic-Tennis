speed = 0
gravity = 0
depth = -300

hsp = 0
vsp = 0
ballHEIGHT = 0
heightSPD = 0
grvtFORCE = 0.35
kickFORCE = 0.72
kick = 0
cai = 0
lastHIT = 0

// quadra e rede, pra bola nao simplesmente sair e ir embora
GROUND = instance_find(obj_ground, 0)
NET = instance_find(obj_NETtennis, 0)

quadraY = room_height - 97
x = room_width * 0.5

//isso td aq eh pra bola poder ser rebatida
ballRETURN = function(hitter, destinyOPPx, destinyOPPy, ballBOOST){
    if (!global.POINT || global.OVER) return
    destinyOPPx = clamp(destinyOPPx, 35, room_width-35)
    if (hitter == 1){
        destinyOPPy = clamp(destinyOPPy, GROUND.quadraTOP+25, NET.netTOP-35)
    } else{
        destinyOPPy = clamp(destinyOPPy, NET.netBOTTOM+35, GROUND.quadraBOTTOM-25)
    }
    ballHEIGHT = max(ballHEIGHT, 24)
    heightSPD = max(8, ballBOOST)
    var timeONair = (heightSPD+sqrt(heightSPD*heightSPD+2*grvtFORCE*ballHEIGHT))/grvtFORCE
    hsp = (destinyOPPx-x)/timeONair
    vsp = (destinyOPPy-quadraY)/timeONair
    lastHIT = hitter
}