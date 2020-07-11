
<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>NUMBER</th>
        <th>操作</th>
        <th>操作</th>
    </tr>
    <%int count = Integer.parseInt(request.getParameter("count"));%>
    <%BigDecimal price = new BigDecimal(request.getParameter("price"));
    price=price.setScale(2, BigDecimal.ROUND_HALF_UP);%>
    <%String name = request.getParameter("name");%>
    <%Connection con = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "kimheechul");
    String strSql = "insert into cart(name,price,num) values(?,?,?)";
    psmt = con.prepareStatement(strSql);
    psmt.setString(1, name);
    psmt.setBigDecimal(2,price);
    psmt.setInt(3, count);
    psmt.executeUpdate();
    psmt.close();//立即释放资源
    DButil util=new DButil();
    double total=0.0;
    List<Product>list=util.readProduct();
    for(Product e:list){ %>
    <tr>
    <td><%=e.getId() %></td>
    <td><%=e.getName() %></td>
    <td><%=e.getPrice() %></td>
    <td><%=e.getNum() %></td>
    </tr>
    <%} %>
</table>
