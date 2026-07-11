gridX = sprite_get_width(bothBox1_spr);
gridY = sprite_get_height(bothBox1_spr);

calcularExpressoes = function(){
    var _qtd = instance_number(IntBox_obj);

    for(var i = 0; i < _qtd; i++)
    {
        var _bloco = instance_find(IntBox_obj, i);

        if(!_bloco.operador)
        {
            lerExpressao(_bloco, 1, 0); //horizontal
            lerExpressao(_bloco, 0, 1); //vertical
        }
    }
}

lerExpressao = function(_blocoInicial, _dx, _dy){
    var _lista = [];

    var _atual = _blocoInicial;

    while(_atual != noone)
    {
        array_push(_lista, _atual);

        var _xx = _atual.x + _dx * gridX;
        var _yy = _atual.y + _dy * gridY;

        _atual = instance_position(_xx, _yy, IntBox_obj);
    }

    validarExpressao(_lista);
}