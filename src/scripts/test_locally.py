from brownie import accounts, interface, PriceOracle

USDC_ADDRESS = "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48"
WETH_ADDRESS = "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2"

UNISWAPV2_ROUTER_ADDRESS = "0xf164fC0Ec4E93095b804a4795bBe1e041497b92a"


price_oracle = PriceOracle.deploy(
    UNISWAPV2_ROUTER_ADDRESS,
    WETH_ADDRESS,
    {"from": accounts[0]},
)

def main():
    a = price_oracle.getAssetPrice(USDC_ADDRESS, 10**6)
    print(a)