<%-- 
    Document   : amortizacao-americana
    Created on : 05/04/2018, 21:18:32
    Author     : Edvaldo Ausuto P Prieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='js/jquery.min.js'></script>
        <script src='js/bootstrap.min.js'></script>
        <script src='js/scripts.js'></script>
        <link href='src/css/bootstrap.css' rel='stylesheet'>

        <title> Amortização Americana</title>
        
    </head>
    <body>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
    <center>
        <h1>Cálculo Sistema de Amortização Americana</h1>
        <form>
            
            <b>Saldo Devedor</b>  <br/><input type="text" name="capital" required=""/><br/>
            <b>Tempo</b>  <br/><input type="number" name="parcelas"  /><br/>
            <b>Taxa de Juros</b>  <br/><input type="number" name="juros"  /><br/>
           <br/> <input type="submit" Value="Enviar"/><br/>
        </form>
        <% try { %>
        
           <%double capital = Double.parseDouble(request.getParameter("capital")); %>  
           <%int parcelas = Integer.parseInt(request.getParameter("parcelas")); %>  
           <%double juros = Double.parseDouble(request.getParameter("juros")); %>  

           <br/>
           
           <p>Um empréstimo de $<%=capital%> a ser pago em <%=parcelas%> meses a uma taxa de juros de <%=juros%>% ao mês, portanto é pago somente os juros e na ultima parcela, é pago o juro + o valor total do saldo devedor inicial. <br/>Logo, a tabela SAA fica:</p>
           
           
            <table border="1" style="text-align: center">
            <tr>
                <th>Período</th>
                <th>Prestação</th> 
                <th>Juros</th>
                <th>Amortização</th> 
                <th>Saldo Devedor</th>
            <tr>
                <td> 0 </td>
                <td> - </td>
                <td> - </td>
                <td> - </td>
                <td>$<%=capital%> </td>
            </tr>
            
            
     
            <% double totalJuros = 0; %>
            
            <% double juro = capital * (double) (juros/100);%>
            <%int i =0;%>
            
            
            <% for (i=1; i <= parcelas; i ++) { %>
            
            
            
             
             <%totalJuros += juro;%> 
             

          
                <%if(i != parcelas){ %>
                   <tr>
                    <td> <b><%=i%></b> </td>
                    <td><b>$<%=juro%></b> </td>
                    <td><b><%=juro%></b></td>
                    <td><b>-</b> </td>
                    <td><b>-</b></td>
                   </tr> 
                <%} else {%>
                
                    <tr>
                    <td> <b><%=i%></b> </td>
                    <td><b>$<%=juro + capital%></b> </td>
                    <td><b>$<%=juro%></b></td>
                    <td><b>$<%=capital%></b> </td>
                    <td><b>-</b></td>
                    </tr>
                    
                    <tr>
                    <td> <b>Total</b> </td>
                    <td><b>$<%=totalJuros + capital %></b> </td>
                    <td><b>$<%=totalJuros%></b></td>
                    <td><b>$<%=capital%></b> </td>
                    <td><b>-</b></td>
                    </tr> 
                    
                
                <%}}%>
                
            </table>
             
                
          
         <% }catch(Exception ex){%>
            
        <%}%>
        
    </center>
    </body>
     <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>
