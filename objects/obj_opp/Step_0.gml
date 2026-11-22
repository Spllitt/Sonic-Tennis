//ve se a bola existe, caso nao encontre, o jogo nao funciona
var ball = instance_find(obj_ball, 0)
if (!variable_global_exists("OVER") && ball != noone) ROUNDstart(ball)
if (ball == noone){
    exit
}

// isso aq vai medir o oponente vvvv
var LEFT = x-bbox_left, RIGHT = bbox_right-x
var TOP = y-bbox_top, BOTTOM = bbox_bottom-y

//essa parte eh oq vai fazer com q calcule o qnt o oponente pd se mover
var minOPPx = 20 + LEFT, maxOPPx = room_width - 20 - RIGHT
var minOPPy = ball.GROUND.quadraTOP + TOP, maxOPPy = ball.NET.netTOP + 20 - BOTTOM

var targetOPPx = room_width * 0.5, targetOPPy = (minOPPy + maxOPPy) * 0.5 //<- ponto do alvo

if (hitCD > 0){
    hitCD--
}

// vvv vai respeitar a rede e vai ficar SO ate ali 
if (global.POINT && ball.quadraY < ball.NET.netTOP){
    targetOPPx = ball.x
    targetOPPy = ball.quadraY
}

targetOPPx = clamp(targetOPPx, minOPPx, maxOPPx)
targetOPPy = clamp(targetOPPy, minOPPy, maxOPPy)

x += clamp(targetOPPx - x, -spdCHAR, spdCHAR)
y += clamp(targetOPPy - y, -spdCHAR, spdCHAR)

var canHIT = ball.quadraY < ball.NET.netTOP && ball.lastHIT != 2 && ball.ballHEIGHT <= 75 && hitCD <= 2

// vvv verificando se ta em cd ou nao, alem de se pode rebater
if (canHIT && point_distance(x, y, ball.x, ball.quadraY) <= reachHIT){
    var aimX = room_width * 0.5
    var aimY = lerp(ball.NET.netBOTTOM, ball.GROUND.quadraBOTTOM, 0.65)

    ball.ballRETURN(2, aimX, aimY, strengthY)
    hitCD = 1
}
// acaba :)
if (!global.POINT){
    exit
}

if (global.OVER){
    exit
}