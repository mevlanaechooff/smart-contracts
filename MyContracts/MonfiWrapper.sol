// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "./MonfiAdapter.sol";

abstract contract MonfiWrapper is MonfiAdapter {
    constructor(
        string memory name,
        uint256 gasEstimate
    ) MonfiAdapter(name, gasEstimate) {}

    function getTokensIn() external view virtual returns (address[] memory);

    function getTokensOut() external view virtual returns (address[] memory);

    function getWrappedToken() external view virtual returns (address);
}
