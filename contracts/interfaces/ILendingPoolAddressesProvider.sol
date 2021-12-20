pragma solidity ^0.5.0;

/**
@title ILendingPoolAddressesProvider interface
@notice provides the interface to fetch the LendingPoolCore address
 */

contract ILendingPoolAddressesProvider {
    function getLendingPool() public view returns (address);
    function setLendingPoolImpl(address _pool) public;
    function getLendingPoolCore() public view returns (address payable);
    function setLendingPoolCoreImpl(address _lendingPoolCore) public;
    function getLendingPoolConfigurator() public view returns (address);
    function setLendingPoolConfiguratorImpl(address _configurator) public;
    function getLendingPoolDataProvider() public view returns (address);
    function setLendingPoolDataProviderImpl(address _provider) public;
    function getLendingPoolParametersProvider() public view returns (address);
    function setLendingPoolParametersProvider(address _parametersProvider) public;
    function getFeeProvider() public view returns (address);
    function setFeeProviderImpl(address _feeProvider) public;
    function getLendingPoolLiquidationManager() public view returns (address);
    function setLendingPoolLiquidationManager(address _manager) public;
    function getLendingPoolManager() public view returns (address);
    function setLendingPoolManager(address _lendingPoolManager) public;
    function getPriceOracle() public view returns (address);
    function setPriceOracle(address _priceOracle) public;
    function getLendingRateOracle() public view returns (address);
    function setLendingRateOracle(address _lendingRateOracle) public;
    function getRewardManager() public view returns (address);
    function setRewardManager(address _manager) public;
    function getLpRewardVault() public view returns (address);
    function setLpRewardVault(address _address) public;
    function getGovRewardVault() public view returns (address);
    function setGovRewardVault(address _address) public;
    function getSafetyRewardVault() public view returns (address);
    function setSafetyRewardVault(address _address) public;
    function getStakingToken() public view returns (address);
    function setStakingToken(address _address) public;
}
