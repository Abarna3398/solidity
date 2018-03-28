pragma solidity ^0.4.0;
contract game_set
{
    uint256 public game_id=100;
    address broker_account;
    uint256 public expiry_time;
    uint256 ex;
    uint256 strike_price;
    uint256 public start_time;
    
    struct product
    {
        string stock_name;
        uint256 strike_price;
        uint256 expiry_time;
    }
   
    mapping (address => mapping (uint256 => product)) game;

    function input (address broker_account,string stock_name,uint256 strike_price,uint256 expiry_time) public
    {
        start_time=now;
        game[broker_account][game_id].stock_name=stock_name;
        game[broker_account][game_id].expiry_time=expiry_time;
        game[broker_account][game_id].strike_price=strike_price;
        game_id +=1;
    }
    
    function hour()public returns(uint256)
    {
        expiry_time= (expiry_time*60)*60;
        expiry_time += start_time;
        return(expiry_time);
    }
    
    function minute()public returns(uint256)
    {
        expiry_time = expiry_time * 60;
        expiry_time = start_time + expiry_time;
        return(expiry_time);
    }
    
    function second()public returns(uint256)
    {
        expiry_time = start_time + expiry_time;
        return(expiry_time);
    }
    
    function show(address broker_account,uint256 game_id)public constant returns(string,uint256,uint256)
    {
        return(game[broker_account][game_id].stock_name,game[broker_account][game_id].expiry_time,game[broker_account][game_id].strike_price);
    }
}
    

