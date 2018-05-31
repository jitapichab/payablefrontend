pragma solidity ^0.4.0;

contract PagarContrato {

 
    constructor()  public payable { }
    
    event QuienPago(address indexed  pagador, uint cantidad);
    event QuienCobro( address indexed cobrador,  uint  cantidad);
    function PagarMas() public payable  {
        emit QuienPago(msg.sender, msg.value);
    }
  
    
    function Cobrar(uint amount) public  {
            msg.sender.transfer(amount);
            emit QuienCobro(msg.sender, amount);
       }
    
    function AcumuladoContrato() view public returns (uint) {
        return address(this).balance;
    }
}