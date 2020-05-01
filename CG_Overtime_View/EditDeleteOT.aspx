<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditDeleteOT.aspx.vb" Inherits="EditDeleteOT" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Username" HeaderText="Username" 
                    SortExpression="Username" />
                <asp:BoundField DataField="Bldg" HeaderText="Bldg" SortExpression="Bldg" />
                <asp:BoundField DataField="Crew" HeaderText="Crew" SortExpression="Crew" />
                <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" 
                    SortExpression="PlantDate" />
                <asp:BoundField DataField="DateEntered" HeaderText="DateEntered" 
                    SortExpression="DateEntered" />
                 <asp:TemplateField HeaderText="OTType" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID = "lblOT" runat="server" Text='<%# Eval("OvertimeType") %>'></asp:Label>
                    <asp:DropDownList ID="ddlOT" runat="server" Visible = "false">
                    <asp:ListItem>Regular</asp:ListItem>
                     <asp:ListItem>MandatoryWD</asp:ListItem>
                     <asp:ListItem>MandatoryWE</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="AskType" HeaderText="AskType" 
                    SortExpression="AskType" />
                <asp:BoundField DataField="ChargedHours" HeaderText="ChargedHours" 
                    SortExpression="ChargedHours" />
                <asp:BoundField DataField="WorkedHours" HeaderText="WorkedHours" 
                    SortExpression="WorkedHours" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" 
                    SortExpression="Comments" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT ID, Name, Username, Bldg, Crew, PlantDate, DateEntered, OvertimeType, AskType, ChargedHours, WorkedHours, Comments FROM t_Hours_Overtime ">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
