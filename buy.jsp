<form id="product" method="post" action="productList.jsp">
    <select id="ID" name="NAME">
    <%for(ProductDB e:list){ %>
    <option value=<%=e.getName() %>><%=e.getName() %></option>
    <%} %>
    </select>
    数量：<input id='count' type="text"/>
    单价：<input id='price' type='text'>
    <input type="submit" value="购买" onclick="fun()"/>
    </form>
 
<script type="text/javascript">
        function fun()
        {
            var  obj=document.getElementById("ID");
            for (i=0;i<obj.length;i++) {//下拉框的长度就是它的选项数.
                if (obj[i].selected== true ) {
                    var text=obj[i].value;//获取当前选择项的 值 .
                }
            }
            var price = document.getElementById('price').value;
            var count = document.getElementById('count').value;
            var total = (count*price).toFixed(2);
        
            if(confirm("确定购买"+text+"支付"+total+"元吗?")){
            
                window.location.href = "productList.jsp";
            }
        }
</script>
