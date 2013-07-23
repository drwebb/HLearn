
data Nat1 = Zero | Succ Nat1
    deriving (Read,Show,Eq,Ord)

decl :: String
decl = concat $ map (\x -> x++"\n") 
    [ "-- | This module was automatically generated by Nat1Generator.hs"
    , "module HLearn.Algebra.Types.Nat1 where"
    , "import GHC.TypeLits"
    , "data Nat1Box (n::Nat1) = Nat1Box"
    , "data Nat1 = Zero | Succ Nat1"
    , "    deriving (Read,Show,Eq,Ord)"
    , "type family FromNat1 (n :: Nat1) :: Nat"
    , "type family ToNat1 (n :: Nat) :: Nat1"
    ]


int2Nat1 :: Int -> Nat1
int2Nat1 0 = Zero
int2Nat1 i = Succ $ int2Nat1 (i-1)

string_ToNat1 :: Int -> String
string_ToNat1 i = "type instance ToNat1 "++show i++" = "++show (int2Nat1 i)

string_FromNat1 :: Int -> String
string_FromNat1 i = "type instance FromNat1 ("++show (int2Nat1 i)++") = "++show i

numNat :: Int
numNat = 200

main = do
    putStrLn decl
    mapM putStrLn $ map string_ToNat1 [0..numNat]
    mapM putStrLn $ map string_FromNat1 [0..numNat]
