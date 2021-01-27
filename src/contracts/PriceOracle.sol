pragma solidity ^0.6.0;

import "../interfaces/openzeppelin-contracts@3.0.0/contracts/math/SafeMath.sol";
import "../interfaces/IUniswapV2Router.sol";

contract PriceOracle {
    IUniswapV2Router router;
    address base_token;

    using SafeMath for uint256;

    constructor(address _router, address _base_token) public {
        router = IUniswapV2Router(_router);
        base_token = _base_token;
    }

    function getAssetPrice(address asset, uint256 supply)
        external
        view
        returns (uint256)
    {
        address[] memory path = new address[](2);
        path[0] = asset;
        path[1] = base_token;
        uint256[] memory amounts = router.getAmountsOut(supply, path);
        return (amounts[1] * 10**18) / amounts[0];
    }
}
