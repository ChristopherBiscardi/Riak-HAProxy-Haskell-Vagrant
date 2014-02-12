echo "Haskell 7.6.3"
sudo apt-get update
sudo apt-get install build-essential haskell-platform -y
cabal update
cabal install cabal-install
