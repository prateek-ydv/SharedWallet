// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract sharedWallet is Ownable(msg.sender) {
    mapping(address =>uint) public allowance;

    
    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount,"you are not allowed");
        _;
    }
    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        
        _to.transfer(_amount);
    }
    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }
    function recieveMoney() external payable{
        
    }

}
