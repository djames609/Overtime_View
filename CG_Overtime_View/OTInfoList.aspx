  <%@ Page Language="VB" AutoEventWireup="false" CodeFile="OTInfoList.aspx.vb" Inherits="OTInfoList" %>

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
     
     
<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server" DataKeyNames="ID" OnRowDataBound="OnRowDataBound" OnRowDeleting="OnRowDeleting" AutoGenerateColumns="false">
     <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           />
                    
        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          />
    <Columns>
     <asp:CommandField ButtonType="Link" ShowDeleteButton="true" />
        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="30" />
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="140" />
        <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100" />
        <asp:BoundField DataField="Bldg" HeaderText="Bldg" ItemStyle-Width="50" />
        <asp:BoundField DataField="Crew" HeaderText="Crew" ItemStyle-Width="50" />
        <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" ItemStyle-Width="50" />
         <asp:BoundField DataField="DateEntered" HeaderText="DateEntered" ItemStyle-Width="50" />
        <asp:BoundField DataField="OvertimeType" HeaderText="OvertimeType" ItemStyle-Width="50" />
        <asp:BoundField DataField="AskType" HeaderText="AskType" ItemStyle-Width="140" />
        <asp:BoundField DataField="ChargedHours" HeaderText="ChargedHours" ItemStyle-Width="30" />
         <asp:BoundField DataField="WorkedHours" HeaderText="WorkedHours" ItemStyle-Width="30" />
         <asp:BoundField DataField="Comments" HeaderText="Comments" ItemStyle-Width="140" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDetails" runat="server" Text="Update Details" PostBackUrl='<%# "~/OTDetailsList.aspx?RowIndex=" & Container.DataItemIndex %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
       
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>"
        DeleteCommand="DELETE FROM t_Hours_Overtime WHERE ID = @ID">
   
    <DeleteParameters>
        <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>
 
    </form>
</body>
</html>
