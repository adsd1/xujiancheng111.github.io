 <%
    DButil util=new DButil();
    double total=0.0;
    List<Product>list=util.readProduct();
    for(Product e:list){ %>
    <tr>
    <td><%=e.getId() %></td>
    <td><%=e.getName() %></td>
    <td><%=e.getPrice() %></td>
    <td><%=e.getNum() %></td>
    <% total=e.getPrice()*e.getNum();%>
    <td><input type="button" name="calculate" onclick="setvalue(<%=total%>)" value="购买"></td>
    </tr>
    <%} %>
</table>
总价：<input type="text" name="result" id="result">
<script>
    function setvalue(v)
    {
        document.getElementById("result").value=v.toFixed(2);
        if(confirm("确定要支付"+document.getElementById("result").value+"元吗？")){
            window.location.href = "productList.jsp";
        }
    }
</script>
