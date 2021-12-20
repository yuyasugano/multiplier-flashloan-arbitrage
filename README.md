# Multipler Flashloan Examplel Part1
 
A sample application invokes a flashloan with `Multipler Flashloan`.  
To know details about `Flash Swaps`: visit https://docs.multiplier.finance/key-features/flash-loan  
  
Article: visit TBD  
  
## Disclaimer
This repo is not either an investment advice or a recommendation or solicitation to buy or sell any investment and should not be used in the evaluation of the merits of making any investment decision. It should not be relied upon for accounting, legal or tax advice or investment recommendations. The contents reflected herein are subject to change without being updated. 

The codes are written for informational and educational purpose only, https and websocket endpoints might not work well if those endpoint have been depreciated. Please find other available endpoints in that case. Thanks for your understanding.
  
## software version
 
Ensure your `node` and `truffle` version is higher than these:
```sh
$ node -v
v14.17.6
$ truffle version
Truffle v5.3.7 (core: 5.3.7)
Solidity - >=0.6.6 <0.8.0 (solc-js)
Node v14.17.6
Web3.js v1.3.6
```
   
## environment variables
 
```
BNB_AMOUNT=10
WALLET_ADDRESS=0x<your wallet address>
PRIVATE_KEY=<private key>
BSS_WSS=wss://bsc-ws-node.nariox.org:443
BSS_HTTPS=https://bsc-dataseed.binance.org/
```
   
## setup steps
  
1. Rename `.env.template` to `.env` and fill out required information
2. Configure `truffle-config.js` with appropriate parameters (if you deploy a contract)  
3. Install node.js packages and compile a smart contract code
```sh
npm install
truffle compile
```
4. Migrate the contract to the network (confirm if you do this in BSC mainnet)
```sh
truffle migrate --network mainnet
```
 
## License
 
This library is licensed under the MIT License. 
