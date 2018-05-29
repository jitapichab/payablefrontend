pragma solidity ^0.4.0;

contract PagarContrato {

 
    constructor()  public payable { }
    
    event QuienPago(address pagador, string fecha, uint cantidad);
    event QuienCobro(address cobrador, string fecha, uint cantidad);
    function PagarMas(string fecha) public payable  {
        emit QuienPago(msg.sender,fecha, msg.value);
    }
  
    
    function Cobrar(uint amount, string fecha) public  {
            msg.sender.transfer(amount);
            emit QuienCobro(msg.sender, fecha, amount);
       }
    
    function AcumuladoContrato() view public returns (uint) {
        return address(this).balance;
    }
}