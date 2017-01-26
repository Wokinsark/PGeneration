function updateGUI(isStart){
    count                   = 0;
    progressCurrent.value   = 0;
    rlInfo.visible          = isStart;
    progressCurrent.visible = isStart;
    tProgress.visible       = isStart;
    tLength.visible         = !isStart;
    sbLength.visible        = !isStart;
    if(isStart){
        resetPassword();
    }
}

function positionChanged(mouse){
    tX = mouse.x;
    tY = mouse.y;
    tT = +new Date();
    tC = ++count;
    tR = getG(tX, tY, tT, tC);
    gamma += tR;

    progressCurrent.value = count;

    if(count == 512){
        tfPassword.text = generation.transformation(gamma).substring(0,sbLength.value);
        messageInformation.text = "Пароль успешно создан";
        messageInformation.open();
        updateGUI(false);
    }
}

function resetPassword(){
    gamma = "";
    tfPassword.text = "";
    for(var i = 0; i < sbLength.value; i++)
        tfPassword.text += "*";
}

function getG(x, y, t, c){
    if(+x < 0){
        x *= -1;
    }
    if(+y < 0){
        y *= -1;
    }
    return ((+x % 2) + (+y % 2) + (+t % 2) + (+c % 2)) % 2
}
