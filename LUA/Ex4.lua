io.write("Digite o primeiro número: ")
local primeiro_numero = tonumber(io.read())

io.write("Digite o segundo número: ")
local segundo_numero = tonumber(io.read())

io.write("Escolha a operação (+, -, *, /): ")
local operacao = io.read()

local resultado

if operacao == "+" then
    resultado = primeiro_numero + segundo_numero
elseif operacao == "-" then
    resultado = primeiro_numero - segundo_numero
elseif operacao == "*" then
    resultado = primeiro_numero * segundo_numero
elseif operacao == "/" then
    if segundo_numero ~= 0 then
        resultado = primeiro_numero / segundo_numero
    else
        print("Erro: divisão por zero!")
        return
    end
else
    print("Operação inválida!")
    return
end

print("Resultado: ", resultado)
