<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test2.aspx.vb" Inherits="test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Emp_Name" 
            DataValueField="Person_ID"  OnSelectedIndexChanged="Person_Selected">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT [Person_ID], [Emp_Name] FROM [t_manual_worked_52] ORDER BY [Emp_Name]">
        </asp:SqlDataSource>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Emp_Name" HeaderText="Emp_Name" 
                SortExpression="Emp_Name" />
            <asp:BoundField DataField="Person_ID" HeaderText="Person_ID" 
                SortExpression="Person_ID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" />
            <asp:BoundField DataField="WorkedHours" HeaderText="WorkedHours" 
                SortExpression="WorkedHours" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
        SelectCommand="SELECT * FROM [t_manual_worked_52] WHERE ([Person_ID] = @Person_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Person_ID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
