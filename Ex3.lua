print("Quantos números terá a lista? ")
local quantidade_numeros = tonumber(io.read())

local lista_numeros = {}
local lista_numeros_pares = {}

for contador = 1, quantidade_numeros do
    print("Digite o número " .. contador .. ": ")
    lista_numeros[contador] = tonumber(io.read())
end

local total_numeros_pares = 0

for contador = 1, quantidade_numeros do
    if lista_numeros[contador] % 2 == 0 then
        table.insert(lista_numeros_pares, lista_numeros[contador])
        total_numeros_pares = total_numeros_pares + 1
    end
end

print("Números pares: ")
for contador = 1, total_numeros_pares do
    io.write(lista_numeros_pares[contador], ", ")
end
print("esses são os números pares da lista")
