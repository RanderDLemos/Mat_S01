function encontrarMaiorValor(listaNumeros)
    local maiorNumero = listaNumeros[1]
    for indice = 2, #listaNumeros do
        if listaNumeros[indice] > maiorNumero then
            maiorNumero = listaNumeros[indice]
        end
    end
    return maiorNumero
end

print("Quantos números terá a lista? ")
local quantidadeNumeros = tonumber(io.read())

local listaNumeros = {}

for contador = 1, quantidadeNumeros do
    print("Digite o número " .. contador .. ": ")
    listaNumeros[contador] = tonumber(io.read())
end

local maiorValorEncontrado = encontrarMaiorValor(listaNumeros)
print("O maior valor da lista é: " .. maiorValorEncontrado)
