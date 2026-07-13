boxSize = sprite_get_width(bothBox1_spr);


function calcularExpressoes()
{
    var _quantidade = instance_number(IntBox_obj);

    for(var _i = 0; _i < _quantidade; _i++)
    {
        var _box = instance_find(IntBox_obj, _i);
		

        // Só começa uma expressão se for um número
        if(!_box.operador)
        {
			var _boxAnterior = encontrarCaixa(_box.x - boxSize, _box.y);

            // Se não existe caixa antes dela, ela é o início
            if(_boxAnterior == noone)
            {
                lerExpressao(_box);
            }
        }
    }
}

function lerExpressao(_boxInicial)
{
    var _expressao = [];

    var _boxAtual = _boxInicial;


    while(_boxAtual != noone)
    {
        array_push(_expressao, _boxAtual);


        _boxAtual = encontrarCaixa(_boxAtual.x + boxSize, _boxAtual.y);
    }


    validarExpressao(_expressao);
}

function validarExpressao(_expressao)
{
    var _tamanho = array_length(_expressao);


    // Precisa ter pelo menos:
    // número operador número
    if(_tamanho < 3)
        return;


    for(var _i = 0; _i < _tamanho; _i++)
    {

        // posições pares precisam ser números
        if(_i mod 2 == 0)
        {
            if(_expressao[_i].operador)
                return;
        }

        // posições ímpares precisam ser operadores
        else
        {
            if(!_expressao[_i].operador)
                return;
        }
    }


    calcularResultado(_expressao);
}

function calcularResultado(_expressao)
{
    var _resultado = _expressao[0].valor;


    for(var _i = 1; _i < array_length(_expressao); _i += 2)
    {
        var _operador = _expressao[_i].valor;
        var _numero = _expressao[_i + 1].valor;


        switch(_operador)
        {

            // soma
            case 0:
                _resultado += _numero;
            break;


            // subtração
            case 1:
                _resultado -= _numero;
            break;


            // multiplicação
            case 2:
                _resultado *= _numero;
            break;


            // divisão
            case 3:

                if(_numero != 0)
                    _resultado /= _numero;

            break;
        }
    }


    show_debug_message("Resultado: " + string(_resultado));


    verificarPortas(_resultado);
}

function encontrarCaixa(_x, _y)
{
    var _qtd = instance_number(IntBox_obj);

    for(var _i = 0; _i < _qtd; _i++)
    {
        var _box = instance_find(IntBox_obj, _i);

        if(_box.x == _x && _box.y == _y)
            return _box;
    }

    return noone;
}

function verificarPortas(_resultado)
{
    with(portao_obj)
    {
        if(_resultado == objetivo)
        {
            aberto = true;
        }
    }
}