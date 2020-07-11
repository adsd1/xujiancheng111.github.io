<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>INVENTORY</th>
    </tr>
    <%
    DButil util=new DButil();
    List<ProductDB>list=util.readFirstProduct();
    for(ProductDB e:list){ %>
    <tr>
    <td><%=e.getId() %></td>
    <td><%=e.getName() %></td>
    <td><%=e.getPrice() %></td>
    <td><%=new Random().nextInt(100) %></td>
    
    </tr>
    <%} %>
</table>
 
public List<ProductDB> readFirstProduct() {
        List<ProductDB> list = new ArrayList<ProductDB>();
        Connection con = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "kimheechul");
            String sql = "select * from product";
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                ProductDB tl = new ProductDB(id, name, price);
                list.add(tl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (psmt != null) {
                    psmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
