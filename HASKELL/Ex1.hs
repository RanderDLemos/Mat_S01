module Main where

data Drink = Drink
  { titulo :: String
  , classe :: String
  , valor  :: Float
  } deriving (Show)

data Situacao = Novo | Finalizado | Suspenso
  deriving (Show, Eq)

data Ordem = Ordem
  { itens   :: [Drink]
  , estado  :: Situacao
  } deriving (Show)

custoOrdem :: Ordem -> Float
custoOrdem (Ordem _ Suspenso) = 0
custoOrdem (Ordem ds _) =
  let soma = sum (map valor ds)
  in soma + 4.5

primeiroItem :: Ordem -> String
primeiroItem (Ordem [] _) = "Nenhum item registrado."
primeiroItem (Ordem (x:_) _) = titulo x

main :: IO ()
main = do
    let d1 = Drink "Latte" "Cafe" 9.0
    let d2 = Drink "Hibisco" "Cha" 4.0
    let d3 = Drink "Uva" "Suco" 6.5

    let o1 = Ordem [d1, d2, d3] Novo
    let o2 = Ordem [] Novo
    let o3 = Ordem [d1] Suspenso

    putStrLn "\nOrdem A:"
    print o1
    putStrLn ("Total: R$" ++ show (custoOrdem o1))
    putStrLn ("Primeiro item: " ++ primeiroItem o1)

    putStrLn "\nOrdem B:"
    print o2
    putStrLn ("Total: R$" ++ show (custoOrdem o2))
    putStrLn ("Primeiro item: " ++ primeiroItem o2)

    putStrLn "\nOrdem C (Suspensa):"
    print o3
    putStrLn ("Total: R$" ++ show (custoOrdem o3))
    putStrLn ("Primeiro item: " ++ primeiroItem o3)
