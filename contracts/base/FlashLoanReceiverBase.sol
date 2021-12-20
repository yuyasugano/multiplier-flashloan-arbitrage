pragma solidity ^0.5.0;

import "../utils/SafeMath.sol";
import "../utils/IERC20.sol";
import "../utils/SafeERC20.sol";
import "../interfaces/IFlashLoanReceiver.sol";
import "../interfaces/ILendingPoolAddressesProvider.sol";

contract FlashLoanReceiverBase is IFlashLoanReceiver {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    // See https://multiplierfinance.medium.com/multi-chain-lend-protocol-is-live-on-bsc-5003735e3c18 
    // The official address should not change once deployed
    ILendingPoolAddressesProvider public addressesProvider = ILendingPoolAddressesProvider(address(0xCc0479a98cC66E85806D0Cd7970d6e07f77Fd633));
    
    address public constant BNB_ADDRESS = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    function() external payable {}

    function transferFundsBackToPoolInternal(address _reserve, uint256 _amount)
        internal
    {
        address payable core = addressesProvider.getLendingPoolCore();
        transferInternal(core, _reserve, _amount);
    }

    function transferInternal(
        address payable _destination,
        address _reserve,
        uint256 _amount
    ) internal {
        if (_reserve == BNB_ADDRESS) {
            //solium-disable-next-line
            _destination.call.value(_amount).gas(50000)("");
            return;
        }
        IERC20(_reserve).safeTransfer(_destination, _amount);
    }
    
    function getBalanceInternal(address _target, address _reserve)
        internal
        view
        returns (uint256)
    {
        if (_reserve == BNB_ADDRESS) {
            return _target.balance;
        }
        return IERC20(_reserve).balanceOf(_target);
    }
}
