pragma solidity >= 0.6.2;

import 'interfaces/TrashStorageInterface.sol';
import 'utils/PseudoRandomUtil.sol';

contract TrashStorage is TrashStorageInterface, PseudoRandomUtil {
    /*************
     * CONSTANTS *
     *************/
    uint16 private constant _COUNT = 32; // 32 × 256 = 8192 bits = 1 KByte



    /*************
     * VARIABLES *
     *************/
    uint256[] private _numbers;



    /*************
     * MODIFIERS *
     *************/
    modifier accept {
        tvm.accept();
        _;
    }



    /***************
     * CONSTRUCTOR *
     ***************/
    constructor() public accept {}




    /************
     * EXTERNAL *
     ************/
    function save1KB() external override accept {
        uint256 random = _getRandom(_numbers.length);
        uint256[] numbers = _numbers;
        for (uint256 i = 0; i < _COUNT; i++) {
            uint256 number = random + i;
            numbers.push(number);
        }
        _numbers = numbers;
    }



    /**********
     * VIEW *
     **********/
    function info() public view returns (uint128 balance, uint256 kiloBytes) {
        return (address(this).balance, (_numbers.length / _COUNT));
    }



    /***********
     * RECEIVE *
     ***********/
    receive() external {}
}