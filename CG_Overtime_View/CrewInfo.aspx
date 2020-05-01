<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrewInfo.aspx.vb" Inherits="CrewInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Home" />
     
     <table border="1" cellpadding="2" cellspacing="2" style="border-collapse: collapse">
        <tr>
         <td style="width: 150px">
                 Name<br />
                <asp:TextBox ID="txtName" runat="server" Width="150" />
            </td>
            <td style="width: 150px">
                 Username<br />
                <asp:TextBox ID="TxtUser" runat="server" Width="150" />
            </td>
                  
          
             <td style="width: 150px">
                 Classification<br />
                <asp:TextBox ID="TxtClass" runat="server" Width="70" />
            </td>
            </tr>
              <tr>
             <td style="width: 150px">
                 Bldg<br />
                 <asp:DropDownList ID="ddBldg" runat="server" 
                     DataSourceID="SqlDataSource4" DataTextField="Bldg" DataValueField="Bldg">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" SelectCommand="SELECT Distinct Bldg FROM [dbo].[t_Employee_OT]  Order by Bldg"></asp:SqlDataSource>
            </td>
            <td style="width: 150px">
                 Crew<br />
                 <asp:DropDownList ID="ddcrew" runat="server" 
                     DataSourceID="SqlDataSource1" DataTextField="Crew" DataValueField="Crew">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
                     SelectCommand="Select  DISTINCT Crew from t_Employee_OT order by Crew">
                 </asp:SqlDataSource>
            </td>
             <td style="width: 150px">
                 PlantDate<br />
               <asp:TextBox ID="txtPlantDate" runat="server"  Width="150"></asp:TextBox></td>
            </tr>
            <tr>
             <td style="width: 150px">
                 Phone<br />
               <asp:TextBox ID="txtPhone" runat="server" ReadOnly = "false" Width="125"></asp:TextBox>
            </td>
            <td style="width: 150px">
                 Status<br />
                 <asp:DropDownList ID="ddStatus" runat="server">
                     <asp:ListItem>Active</asp:ListItem>
                     <asp:ListItem>Inactive</asp:ListItem>
                 </asp:DropDownList>
            </td>
           
            <td style="width: 100px">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
            </td>
        </tr>
    </table>
<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowDeleting="OnRowDeleting" AutoGenerateColumns="false">
    <Columns>
     <asp:CommandField ButtonType="Link" ShowDeleteButton="true" />
        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="30" />
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="30" />
        <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100" />
      
        <asp:BoundField DataField="Classification" HeaderText="Classification" ItemStyle-Width="50" />
         <asp:BoundField DataField="Bldg" HeaderText="Bldg" ItemStyle-Width="50" />
        <asp:BoundField DataField="Crew" HeaderText="Crew" ItemStyle-Width="50" />
        <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" ItemStyle-Width="140" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-Width="140" />
         <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="140" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDetails" runat="server" Text="Update Details" PostBackUrl='<%# "~/CrewDetails.aspx?RowIndex=" & Container.DataItemIndex %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
       
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>"
        DeleteCommand="DELETE FROM t_Employee_OT WHERE ID = @ID">
   
    <DeleteParameters>
        <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>
 
    </form>
</body>
</html>
