<%-- 
    Document   : calendario
    Created on : 15 de mar. de 2021, 19:48:56
    Author     : andersons
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!SEMPRE DEIXAR O CÓDIGO ANTES DO HTML!!!!!>

<% 
    
   int ano = 0;
   int mes = 0;
   int data = 1;
   int DiaDaSemana = 0;
   int dia = 1;
   int totalDias = 30;
   int i = 0; 
   int anoAtual = 0;
   int mesAtual = 0; 
   String errorMessage = null;
   try{
       
      //CONSERTAR!!!PROBLEMA NO INPUT DO MES E ANO DO USUARIO 
      mes=Integer.parseInt(request.getParameter("mes"));
      ano=Integer.parseInt(request.getParameter("ano"));
      if (mes > 12)
        {
            mes = 1;
            ano++;
        }
        if (mes < 1)
        {
            mes = 12;
            ano--;
        }
    }catch(Exception ex){
       errorMessage = "Erro na leitura dos parâmetros";
    
    }
     // year = year-1900, month de 0 a 11, date = dia do mês 
    // classe Calendar()
    
    java.util.Date calendario = new java.util.Date();
    //GregorianCalendar calendar = new GregorianCalendar();
   anoAtual = calendario.getYear();
   mesAtual = calendario.getMonth();
   //mesAtual = mesAtual +1;
   //anoAtual = anoAtual + 1900;
   //mesAtual = mes+1;
   //anoAtual = ano;
   
    //getDay = dia da semana 0 = domingo
    DiaDaSemana = calendario.getDay();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CALENDÁRIO - JSP</title>
            <style>
            table th {
                padding: 10px;
            }
            
            #calendarioStyle {
                display:flex;
                flex-direction: column;
                align-items: center;
            }
            
            header {
                width: 402px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            button {
                padding: 10px;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <a href="index.html">VOLTAR</a>
        <h1>CALENDÁRIO</h1>
        <div id="calendarioStyle">
            <header>
                <form action="calendario.jsp">
                    <input type="hidden" name="ano" value="<%= ano %>">
                    <input type="hidden" name="mes" value="<%= mes %>">
                    <input type="submit" value="Anterior">
                </form>
                
                <h2>
                    <%     
                        switch(mesAtual)
                        {
                            case 1:
                                out.println("Janeiro");
                                totalDias = 31;
                                break;
                            case 2:
                                out.println("Fevereiro");
                                //verificar se ano é bissexto
                                   if ((ano % 4 == 0 && ano % 100 != 0) || ano % 400 == 0)
                                    {
                                        totalDias = 29;
                                    } 
                                    else
                                   {
                                       totalDias = 28;
                                   }
                                break;
                            case 3:
                                out.println("Março");
                                totalDias = 31;
                                break;
                            case 4:
                                out.println("Abril");
                                break;
                            case 5:
                                out.println("Maio");
                                totalDias = 31;
                                break;
                            case 6:
                                out.println("Junho");
                                break;
                            case 7:
                                out.println("Julho");
                                totalDias = 31;
                                break;
                            case 8:
                                out.println("Agosto");
                                totalDias = 31;
                                break;
                            case 9:
                                out.println("Setembro");
                                break;
                            case 10:
                                out.println("Outubro");
                                totalDias = 31;
                                break;
                            case 11:
                                out.println("Novembro");
                                break;
                            case 12:
                                out.println("Dezembro");
                                totalDias = 31;
                                break;
                            default:
                                break;
                        } %>
                        <%= anoAtual %>
                </h2>
                
                <form action="calendario.jsp">
                    <input type="hidden" name="year" value="<%=ano%>">
                    <input type="hidden" name="month" value="<%=mes+1%>">
                    <input type="submit" value="Seguinte">
                </form>
                                
            </header>    
            <div>
                <table border="1" style="border-collapse: collapse;">
                    <tr>
                        <th>Domingo</th>
                        <th>Segunda-feira</th>
                        <th>Terça-feira</th>
                        <th>Quarta-feira</th>
                        <th>Quita-feira</th>
                        <th>Sexta-feira</th>
                        <th>Sábado</th>
                    </tr>
                    <%--Primeira linha --%>
                    <tr>
                        <% for(int j = 0; j < 7; j++)
                        {%>    
                            <% if( j < DiaDaSemana) 
                            {%>
                                <td></td> 
                            <%} 
                            else
                            {%>
                                <td><%= dia++ %></td> 
                            <%}%>
                        <%}%>
                    </tr>

                    <%--Próximas linhas --%>
                    <% for (i = 0 ; i < 5; i++) 
                    {%>
                        <tr>
                            <% for(int j = 0; j < 7; j++)
                            {%>  
                                <% if (dia <= totalDias)
                                {%>
                                    <td><%= dia++ %></td>
                                <%}%>
                            <%}%>
                        </tr>
                    <%}%>

                </table>
            </div>
        </div>
    </body>
</html>
