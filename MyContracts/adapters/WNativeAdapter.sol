// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "../MonfiAdapter.sol";

contract WNativeAdapter is MonfiAdapter {
    address internal immutable WNATIVE;

    constructor(
        string memory _name,
        address _wNative,
        uint256 _swapGasEstimate
    ) MonfiAdapter(_name, _swapGasEstimate) {
        WNATIVE = _wNative;
        setSwapGasEstimate(_swapGasEstimate);
    }

    function _query(
        uint256 _amountIn,
        address _tokenIn,
        address _tokenOut
    ) internal view override returns (uint256 amountOut) {
        if (_tokenIn == WNATIVE && _tokenOut == WNATIVE) amountOut = _amountIn;
    }

    function _swap(
        uint256 _amountIn,
        uint256,
        address,
        address _tokenOut,
        address _to
    ) internal override {
        _returnTo(_tokenOut, _amountIn, _to);
    }
}
