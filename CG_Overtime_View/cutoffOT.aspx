<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cutoffOT.aspx.vb" Inherits="cutoffOT" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ListBox ID="Lbcrew" runat="server" DataSourceID="SqlDataSource1" SelectionMode="Multiple"
            DataTextField="Crew" DataValueField="Crew"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select  Distinct Crew from t_employee_OT where BLDG = 'Building 6' and crew &lt;&gt; 'Building 6-'">
        </asp:SqlDataSource>
    
        <asp:DropDownList ID="ddcutoff" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="sundate" DataValueField="sundate">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="select sundate from t_ot_cutoff order by Sundate">
        </asp:SqlDataSource>
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
