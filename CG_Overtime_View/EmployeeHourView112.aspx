<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmployeeHourView112.aspx.vb" Inherits="EmployeeHourView112" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .grid
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        .grid th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        .grid th, .grid td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        .grid, .grid table td
        {
            border: 0px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Home" />

    <br />
    <asp:ListBox ID="lstEmployee" runat="server" AutoPostBack="True" 
        OnSelectedIndexChanged="Employee_Selected" DataSourceID="SqlDataSource1" 
        DataTextField="Emp_Name" DataValueField="Person_ID">
        
    </asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
        
        SelectCommand="SELECT  tmw.Person_ID, Max(tmw.Emp_Name) as Emp_Name FROM t_manual_worked_52 tmw inner join t_employee_OT teo on tmw.Person_ID = teo. Username where teo.Bldg = 'Building 112' Group By tmw.Person_ID Order by Max(Emp_Name)"></asp:SqlDataSource>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass = "grid"  PageSize = "15" AllowPaging = "true" OnPageIndexChanging = "OnPageIndexChanging" ShowFooter="true" EmptyDataText="No records have been added.">
        <Columns>
            <asp:BoundField HeaderText="Employee Name" DataField="Emp_Name" />
            <asp:BoundField HeaderText="Person_ID" DataField="Person_ID" />
            <asp:BoundField HeaderText="DateWorked" DataField="Date" />
            <asp:BoundField HeaderText="Dept" DataField="Dept" />
            <asp:BoundField HeaderText="Worked Hours" DataField="WorkedHours" />
            <asp:BoundField HeaderText="Charged Hours" DataField="ChargedHours" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>