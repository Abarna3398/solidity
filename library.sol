pragma solidity ^0.4.0;
contract lib
{
    address public owner;
    
    struct stu
    {
        string stu_name;
        uint256 stu_id;
        uint256 count;
    }
    struct book
    {
        string[] book_name;
        uint256[] book_id;
        uint256[] book_avail;
    }
    mapping(uint256 => stu ) stu_map;
    mapping(address => book) book_map;
    mapping(uint256 => mapping(address => uint256 ))dbl_map;
    
    function get_sdetails(string stu_name,uint256 stu_id)public
    {
        stu_map[stu_id].stu_name=stu_name;
        stu_map[stu_id].stu_id=stu_id;
    }
    function get_bdetails(string book_name,uint256 book_id,uint256 book_avail)public
    {
        book_map[owner].book_name.push(book_name);
        book_map[owner].book_id.push(book_id);
        book_map[owner].book_avail.push(book_avail);
        for(uint256 i=0;i<book_map[owner].book_id.length;i++)
        dbl_map[book_id][owner]=book_avail;
    }
    function getbook(uint256 stu_id,uint256 book_id)public
    {
        require(dbl_map[book_id][owner]>0);
        dbl_map[book_id][owner] -=1;
       stu_map[stu_id].count +=1;
    }
    function view_avail(uint256 book_id)public constant returns(uint256)
    {
        return(dbl_map[book_id][owner]);
    }
    function countt(uint256 stu_id)public constant returns(uint256)
    {
        return(stu_map[stu_id].count);
    }
   function return_book(uint256 stu_id,uint256 book_id)public returns(bool)
    {
        dbl_map[book_id][owner] +=1;
        stu_map[stu_id].count -=1;
         return true;
    }
}
