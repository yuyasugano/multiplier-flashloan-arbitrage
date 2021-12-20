// test a flashloan in Multipler V1
require('dotenv').config();
const Web3 = require('web3');
const BigNumber = require('bignumber.js');

const abis = require('./abis');
const instance = require('./build/contracts/Flashloan.json');
const web3 = new Web3(
    new Web3.providers.HttpProvider(process.env.BSC_HTTPS)
);
const { address: admin } = web3.eth.accounts.wallet.add(process.env.PRIVATE_KEY);

const amount = process.env.BNB_AMOUNT;

const flashloan = async() => {
    const networkId = await web3.eth.net.getId();
    const contract = new web3.eth.Contract(
        instance.abi,
        instance.networks[networkId].address
    );

    const borrow = await new BigNumber(amount).shiftedBy(18);
    const tx = await contract.methods.flashloanBnb(borrow);

    // gas and gasPrice are manually set
    const data = tx.encodeABI();
    const txData = {
        from: admin,
        to: contract.options.address,
        data,
        gas: 310000,
        gasPrice: 5000000000, // 5Gwei
    };

    const receipt = await web3.eth.sendTransaction(txData);
    console.log(`Transaction hash: ${receipt.transactionHash}`);
}

flashloan();

