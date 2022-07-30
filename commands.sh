#Install Sugar
bash <(curl -sSf https://sugar.metaplex.com/install.sh)
sugar --version

# Install Solana Tool Suite
sh -c "$(curl -sSfL https://release.solana.com/v1.10.32/install)"
solana --version

# Setup Wallets
solana-keygen new --outfile ./wallets/Owner.json #7tzSHXU8xRaw9tiieUD13ZzbmJTpzFbEnoa7aUtv58Pj
solana-keygen new --outfile ./wallets/Treasury.json #58hLAyPFNr7hxmFpLZorp81zNPffSkV1kfq6mgE9NA8r
solana-keygen new --outfile ./wallets/Creator.json #PBPzo6aruPXje3MwMELiyaYsSmhDdNFhnMMbnrrrhZx

# Set Main Wallet
solana config set --keypair ./wallets/Owner.json

# Set to Dev Network
solana config set --url https://metaplex.devnet.rpcpool.com/

#Check Balance
solana balance

#Fund Your Wallet with 2 SOL
solana airdrop 2

# Download Assets
curl https://docs.metaplex.com/assets/files/assets-ff6bd873ecd07b49c86faf3c7aab82d2.zip --output ./assets.zip
unzip assets.zip

# Launch Interactive Setup
sugar launch
# Candy Machine ID: 69chg4Vycd2c3F8aizD9Hh3dsJmUS5epj6fdvH1vgdiu
# Candy Machine URL: https://www.solaneyes.com/address/69chg4Vycd2c3F8aizD9Hh3dsJmUS5epj6fdvH1vgdiu?cluster=devnet

# Setup Candy Machine UI
git clone https://github.com/metaplex-foundation/candy-machine-ui ./candy-machine-ui/
cd ./candy-machine-ui/

# Install Dependencies
yarn install

#Change Candy Machine ID to 69chg4Vycd2c3F8aizD9Hh3dsJmUS5epj6fdvH1vgdiu
cp .env.example .env

# Start Website
yarn start