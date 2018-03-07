pragma solidity ^0.4.0;
contract vote
{
    uint256 public t;
    uint256 public v;
    struct candidate
    {
        string cname;
        uint256 cid;
        uint256 votes;
    }
    struct ppl
    {
        uint256 voterid;
    }
    mapping (uint256 => candidate)cmap;
    mapping (uint256 => ppl)pmap;
    function vote()
    {
        t = now + 2 days;
        v = now + 24 days;
    }
    modifier enroll()
    {
        require(t>now);
        _;
    }
    modifier votetime()
    {
         require(v>now);
        _;
    }
    modifier check(uint256 pid)
    {
        require(pmap[pid].voterid!=pid);
        _;
    }
    function get_cdetails(string cname,uint128 cid)public 
    {
       
        cmap[cid].cname=cname;
        cmap[cid].cid=cid;
        //cmap[cid].votes=votes;
    }
    function votee(uint256 voterid,uint256 cid)public check(voterid) returns(string)
    {
        pmap[voterid].voterid=voterid;
        cmap[voterid].votes+=1;
        return("voted successfully");
    }
    function result()public constant returns(string)
    {
        if(cmap[1].votes>cmap[2].votes && cmap[1].votes>cmap[3].votes)
        {
            return("candidate1 won the election");
        }
        else if(cmap[2].votes>cmap[3].votes && cmap[2].votes>cmap[1].votes)
        {
            return("candidate2 won the election");
        }
        else
        {
            return("candidate3 won the election");
        }
    }
    function view_votes(uint256 cid)public constant returns(uint256)
    {
        return(cmap[cid].votes);
    }
}
