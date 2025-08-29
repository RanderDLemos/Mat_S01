local inicio_intervalo, fim_intervalo, base

print("Entre com o primeiro parâmetro do intervalo: ")
inicio_intervalo = tonumber(io.read())
print("Entre com o segundo parâmetro do intervalo: ")
fim_intervalo = tonumber(io.read())
print("Digite um valor inteiro para ser a base: ")
base = tonumber(io.read())

if inicio_intervalo > fim_intervalo then
  print("Intervalo inválido! O valor inicial deve ser menor ou igual ao valor final.")
else
  print("Múltiplos de ", base, " no intervalo [", inicio_intervalo, ", ", fim_intervalo, "]:")
  for numero = inicio_intervalo, fim_intervalo do
      if numero % base == 0 then
          print(numero)
      end
  end
end
