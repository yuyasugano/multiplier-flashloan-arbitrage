pragma solidity ^0.5.0;

import "./base/FlashLoanReceiverBase.sol";
import "./interfaces/ILendingPoolAddressesProvider.sol";
import "./interfaces/ILendingPool.sol";

contract Flashloan is FlashLoanReceiverBase {

    address public receiver = address(this);
    address public constant BNB_ADDRESS = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    function flashloanBnb(uint256 _amount) external  {
        bytes memory data = "";

        ILendingPool lendingPool = ILendingPool(
            addressesProvider.getLendingPool()
        );
        // invoke a flashloan and receive a loan on this contract address
        lendingPool.flashLoan(receiver, BNB_ADDRESS, _amount, data);
    }

    function executeOperation(
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    ) external {
        require(
            _amount <= getBalanceInternal(address(this), _reserve),
            "Invalid balance, was the flashLoan successful?"
        );

        //
        // Your logic goes here.
        // !! Ensure that *this contract* has enough of `_reserve` funds to payback the `_fee` !!
        //

        // IDefi app = IDefi(defi);
        // Todo: Deposit into defi smart contract
        // app.depositBNB.value(_amount)(_amount);
        
        // Todo: Withdraw from defi smart contract
        // app.withdraw(_amount);

        uint256 totalDebt = _amount.add(_fee);
        transferFundsBackToPoolInternal(_reserve, totalDebt);
    }
}
