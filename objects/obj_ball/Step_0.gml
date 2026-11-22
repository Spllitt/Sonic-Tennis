// vvvvv faz com q a bola respawne
if (!variable_global_exists("OVER")) ROUNDstart(id)
if (ROUNDupdate(id)) exit

var steps = max(1, ceil(max(abs(hsp), abs(vsp))/4))
repeat (steps){
    x += hsp/steps
    quadraY += vsp/steps
    heightSPD -= grvtFORCE/steps
    ballHEIGHT += heightSPD/steps
// ^^^^ essa parte vai movimentar a bola

// vvv quando a bola tocar no chao ela vai quicar, alem de: verificar se voce fez ponto ou nao
if (ballHEIGHT <= 0 && heightSPD < 0){
        ballHEIGHT = 0
        if (lastHIT == 0){
            ROUNDrepeatHit(id)
            break
        }
        if (kick == 0){
            kick = 1
            if (quadraY > NET.netMID){
                gainPOINT(id, 2)
            } else{
                gainPOINT(id, 1)
            }
            break
        }
    }
}

y = quadraY - ballHEIGHT