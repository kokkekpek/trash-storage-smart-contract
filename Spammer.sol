pragma solidity >= 0.6.2;

import 'interfaces/TrashStorageInterface.sol';

contract Spammer {
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
    function save(address addr, uint16 kiloBytes) public pure accept {
        for (uint16 i = 0; i < kiloBytes; i++)
            TrashStorageInterface(addr).save1KB();
    }



    /***********
     * RECEIVE *
     ***********/
    receive() external {}
}