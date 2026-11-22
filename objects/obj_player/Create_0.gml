move = 0
hsp = 0
spdCHAR = 9

reachHIT = 80
strengthX = 11
strengthY = 8
hitCD = 0

vspeed = 0
gravity = 0
hspeed = 0
depth = -200

//vvv pra nao ficar feio no ngc pricipal
ballHIT = function(BALL){
    return (BALL != noone && hitCD <= 0 && global.POINT && BALL.lastHIT != 1 && BALL.quadraY > BALL.NET.netBOTTOM && BALL.ballHEIGHT <= 110)
}