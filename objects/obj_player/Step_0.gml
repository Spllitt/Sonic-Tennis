var ball = instance_find(obj_ball, 0)
if (!variable_global_exists("OVER") && ball != noone) ROUNDstart(ball)

move = -keyboard_check(vk_left)+keyboard_check(vk_right)

hsp = move * spdCHAR
x += hsp
var movementX = move

/*pulo vvvvvv mas se pa q nem vai ser usado
if place_meeting(x,y+1,obj_NETtennis){
    vspeed=0

    if keyboard_check_pressed(vk_space){
        vspeed=-3
}}
else{
    vspeed+=0.3
}
vou deixar guardado, VAI que ne.*/

if (hitCD > 0){
    hitCD--
}

if (keyboard_check(vk_space) && ballHIT(ball)){
	var distanceBALL = point_distance(x, y, ball.x, ball.quadraY)

    if (distanceBALL <= 125){
        var aimX =
            x + movementX * 280 + random_range(-30, 30)
        var aimY = lerp(ball.GROUND.quadraTOP, ball.NET.netTOP, 0.35)

        ball.ballRETURN(1, aimX, aimY, strengthY)
        hitCD = 12
    }
}

//pro jogador nao sair da tela vvvvvv
var Xmin = 20
var Xmax = room_width - 20
x = clamp(x, Xmin, Xmax)

//rodada acaba vv
if (global.OVER){
    exit
}