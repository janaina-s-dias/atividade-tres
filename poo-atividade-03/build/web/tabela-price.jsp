<%-- 
    Document   : tabela-price
    Created on : 04/04/2018, 23:12:28
    Author     : JANAINASILVADIAS
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='js/jquery.min.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/scripts.js'></script>
        <link href='src/css/bootstrap.css' rel='stylesheet'>

        <title>Tabela Price</title>
        
    </head>
    <body>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
    <center>
        <h1>Cálculo Tabela Price </h1>
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
            
           <% double valorParcela =  capital/((1-(Math.pow((1+(juros/100)), -parcelas)))/(juros/100));    %>
    
           <%DecimalFormat formatador = new DecimalFormat("0.00");%>
           
     
           <p>Valor da PMT: <%=formatador.format(valorParcela)%></p>
            
           
           <% double valorAmortizacao = (valorParcela-(capital*juros/100));%>  
           <br/>
           
          
            

<table border="1" style="text-align: center">
            <tr>
                <th>Período</th>
                <th>Amortização</th> 
                <th>Juros</th>
                <th>Prestação</th> 
                <th>Saldo Devedor</th>
            <tr>
                <td> 0 </td>
                <td> - </td>
                <td> - </td>
                <td> - </td>
                <td><%=formatador.format(capital)%> </td>
            </tr>
            

            <% double novoCapital = 0; %>
            <% novoCapital = (capital - valorAmortizacao);%>
            <% double novoJuro = (capital*juros)/100; %>
            <% double novaAmortizacao = (valorParcela-novoJuro);%>
            
            <% int totalJuro = 0;%>
            <% double totalAmortizacao = 0;%>
            <% int totalPrestacao = 0;%>
            
            
            
            <% for (int i=1; i <= parcelas; i ++) { %>
            
           
            
            <tr>
                <td> <%=i%> </td>
                <td><%=formatador.format(novaAmortizacao)%> </td>
                <td><%=formatador.format(novoJuro)%> </td>
                <td><%=formatador.format(valorParcela)%> </td>
                <td><%=formatador.format(novoCapital)%> </td>
            </tr>  
             
             
             <%novoJuro = (novoCapital*juros)/100; %> 
             <%novaAmortizacao = (valorParcela-(novoCapital*(juros/100)));%>
             <%novoCapital = (novoCapital - novaAmortizacao); %>
            
             
            <%totalAmortizacao = (totalAmortizacao + valorAmortizacao);%>
          
            
                <%}%>
               
            </table>
           
           
          
         <% }catch(Exception ex){%>
             Entre com um número válido.
        <%}%>
        
    </center>
    </body>
     <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
