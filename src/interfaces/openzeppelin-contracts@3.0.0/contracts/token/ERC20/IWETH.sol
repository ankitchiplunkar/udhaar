pragma solidity ^0.6.0;
import "./IERC20.sol";


/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IWETH is IERC20 {
    function deposit() external payable;

    function withdraw(uint256) external;
}
