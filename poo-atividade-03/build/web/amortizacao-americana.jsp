<%-- 
    Document   : amortizacao-americana
    Created on : 05/04/2018, 01:18:51
    Author     : JANAINASILVADIAS
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='js/jquery.min.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/scripts.js'></script>
        <link href='src/css/bootstrap.css' rel='stylesheet'>

        <title>Amortização Americana</title>
        
    </head>
    <body>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
    <center>
        <h1>Amortização Americana</h1>
        <form>
            
            <b>Saldo Devedor</b>  <br/><input type="text" name="capital" required=""/><br/>
            <b>Tempo</b>  <br/><input type="number" name="parcelas"  /><br/>
            <b>Taxa de Juros</b>  <br/><input type="number" name="juros"  /><br/>
           <br/> <button type="submit" class="btn btn-danger" >Simular</button>
        </form>
        <% try { %>
        
           <%int capital = Integer.parseInt(request.getParameter("capital")); %>  
           <%int parcelas = Integer.parseInt(request.getParameter("parcelas")); %>  
           <%double juros = Integer.parseInt(request.getParameter("juros")); %>  
            
          
           <%DecimalFormat formatador = new DecimalFormat("0.00");%>
           
           <%double valorJuros = (capital*juros)/100;%>
           
     
          
          
            

<table border="1" style="text-align: center">
            <tr>
                <th>Nº Prestação</th>
                <th>Amortização</th> 
                <th>Juros</th>
                <th>Dívida</th> 
                 
            <tr>
                <td> 0 </td>
                <td> 0 </td>
                <td> 0 </td>            
                <td><%=formatador.format(capital)%> </td>
            </tr>
            
 
            
            
            <% double totalJuro = 0;%>
            <% double totalAmortizacao = 0;%>
              
            <% for (int i=1; i <= parcelas; i ++) { %>
                      
            <tr>
                <td><%=i%> </td>
                <td>0</td>
                <td><%=formatador.format(valorJuros)%> </td>
                <td><%=formatador.format(capital)%> </td>
                
            </tr>  
             

             
            <%totalAmortizacao = (totalAmortizacao + valorJuros);%>
            <%totalJuro = (totalJuro + valorJuros);%>
          
            
                <%}%>
                
                <tr>
                    <td> <b>Total</b> </td>
                    <td><b><%=formatador.format(capital)%></b> </td>
                    <td><b><%=formatador.format(totalJuro)%></b></td>
                    <td><b>0</b> </td>
                    
                </tr>
               
            </table>
           
           
          
         <% }catch(Exception ex){%>
             Entre com um número válido.
        <%}%>
        
    </center>
    </body>
     <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>