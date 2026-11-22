//vvvvvv começo do round
function START(){
    if (!variable_global_exists("SCORE")) global.SCORE = 0
    if (!variable_global_exists("oppSCORE")) global.oppSCORE = 0
    if (!variable_global_exists("OVER")) global.OVER = false
    global.POINT = false
    global.ROUNDtimer = game_get_speed(gamespeed_fps)
    global.directHIT = -1
}

// reseta a bola/faz ela aparecer no meio do ngc ai
function ROUNDresetBall(BALL, direction){
    if (!variable_instance_exists(BALL.GROUND, "quadraTOP")){
        BALL.GROUND.quadraTOP = 260
        BALL.GROUND.quadraBOTTOM = room_height - 22
    }

    if (!variable_instance_exists(BALL.NET, "netTOP")){
        BALL.NET.netTOP = 480
        BALL.NET.netBOTTOM = 576
        BALL.NET.netMID = (480 + 576) * 0.5
        BALL.NET.netHEIGHT = 38
    }

    if (direction < 0){
    global.directHIT = -1
} else{
    global.directHIT = 1
}

BALL.x = room_width * 0.5

if (global.directHIT < 0){
    BALL.quadraY = min(BALL.GROUND.quadraBOTTOM - 35, BALL.NET.netBOTTOM + 90)
} else {
    BALL.quadraY = max(BALL.GROUND.quadraTOP + 35, BALL.NET.netTOP - 90)
}
    BALL.ballHEIGHT = 55
    BALL.heightSPD = 8
    BALL.hsp = 0
    BALL.vsp = 5 * global.directHIT
    BALL.kick = 0
    BALL.cai = 0
    BALL.lastHIT = 0
    global.POINT = true
    global.ROUNDtext = ""
    BALL.y = BALL.quadraY - BALL.ballHEIGHT
}

// inicializa a partida e posiciona a bola
function ROUNDstart(BALL){
    START()
    ROUNDresetBall(BALL, global.directHIT)
}

/* a bola vai continuar aparecendo ate voce bater nela de novo
isso faz com q o oponente nao ganhe pontos injustos E nao vai crashar o jogokkkkkkkk*/
function ROUNDrepeatHit(BALL){
    global.POINT = false
    BALL.hsp = 0
    BALL.vsp = 0
    BALL.heightSPD = 0
    global.ROUNDtimer = game_get_speed(gamespeed_fps)
    global.ROUNDtext = "BATE na bola >:("
}

/*td vez q vc atingir 5pts e apertar enter (pra resetar)
ele vai dar update e começar outra rodada, a bola vai voltar pro centro*/
function ROUNDupdate(BALL){
    if (global.OVER){
        if (keyboard_check_pressed(vk_enter)){
            RESET()
            global.ROUNDtext = "se preparaaaaaaaaa"
        }
        return true
    }

    if (!global.POINT) {
        global.ROUNDtimer--
        if (global.ROUNDtimer <= 0) ROUNDresetBall(BALL, global.directHIT)
        return true
    }
    return false
}

/*este eh pra voce ganhar pontos/adversario ganhar pontos, tds as vezes
q a bola for batida e cair no chao*/
function gainPOINT(BALL, WINNER){
    if (!global.POINT || global.OVER){
		return
		}

    global.POINT = false
    BALL.hsp = 0
    BALL.vsp = 0
    BALL.heightSPD = 0
    global.ROUNDtimer = round(game_get_speed(gamespeed_fps) * 1.5)

    if (WINNER == 1){
        global.SCORE++
        global.ROUNDtext = "ponto seu ebaa"
        global.directHIT = -1
    } else{
        global.oppSCORE++
        global.ROUNDtext = "ponto do adversario BOOOOOOO"
        global.directHIT = 1
    }

    if (global.SCORE >= 5 || global.oppSCORE >= 5){
        global.OVER = true
        if (global.SCORE >= 5) global.ROUNDtext = "voce ganhou man parabens"
        else global.ROUNDtext = "mto rui voce"
    }
}

//vvvvv isso aq eh o score :D
function drawROUND(){
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    draw_text(display_get_gui_width() * 0.5, 24, string(global.SCORE) + "  x  " + string(global.oppSCORE))
    if (global.ROUNDtext != "") draw_text(display_get_gui_width() * 0.5, 56, global.ROUNDtext)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}

function RESET(){
    global.SCORE = 0
    global.oppSCORE = 0
    global.OVER = false
    global.POINT = false
    global.ROUNDtimer = game_get_speed(gamespeed_fps)
    global.directHIT = -1
}