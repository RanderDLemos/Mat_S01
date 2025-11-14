module Main where

data Produto = Produto
  { tituloProd :: String
  , classeProd :: String
  , valorProd  :: Double
  } deriving (Show)

data Carrinho = Carrinho
  { conteudo :: [Produto]
  } deriving (Show)

bonus :: [Produto] -> Double
bonus xs =
  let total = sum (map valorProd xs)
  in if total > 200 then total * 0.10 else 0

precoFinal :: Carrinho -> Double
precoFinal (Carrinho xs)
  | soma > 200 = soma - reducao
  | otherwise  = soma + 15
  where
    soma = sum (map valorProd xs)
    reducao = bonus xs

main :: IO ()
main = do
    putStrLn "====== LOJA DO REINO ======"

    let p1 = Produto "Lâmina Real" "Arma" 150
    let p2 = Produto "Elixir Vermelho" "Pocao" 40
    let p3 = Produto "Aegis Sagrada" "Equipamento" 120
    let p4 = Produto "Projéteis" "Arma" 30

    let c1 = Carrinho [p1, p2]
    let c2 = Carrinho [p3, p2, p4]
    let c3 = Carrinho [p3, p1]

    putStrLn "\nCarrinho 1:"
    print c1
    putStrLn ("Preço final: " ++ show (precoFinal c1))

    putStrLn "\nCarrinho 2:"
    print c2
    putStrLn ("Preço final: " ++ show (precoFinal c2))

    putStrLn "\nCarrinho 3 (com bônus):"
    print c3
    putStrLn ("Preço final: " ++ show (precoFinal c3))
