<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type = "text/css">
    input[type=text], select{background-color:#FFFFD2; border:1px solid #ccc}
    </style>
</head>
<body style = "font-family:Arial;font-size:10pt">
    <form id="form1" runat="server">
    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"  DataKeyNames = "ID">
    <Columns>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:CheckBox ID = "chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                <asp:TextBox ID="Txtname" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="username" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                <asp:TextBox ID="TxtUsername" runat="server" Text='<%# Eval("userName") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="DateAsked" ItemStyle-Width = "400">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("DateEntered") %>'></asp:Label>
                    <asp:TextBox ID="TxtDateEntered" runat="server"  ReadOnly = "True"  Text='<%# Eval("DateEntered") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OTType" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID = "lblOT" runat="server" Text='<%# Eval("OvertimeType") %>'></asp:Label>
                    <asp:DropDownList ID="ddlOT" runat="server" Visible = "false">
                    <asp:ListItem>Early</asp:ListItem>
                    <asp:ListItem>Over</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                     <asp:ListItem>MandatoryWD</asp:ListItem>
                     <asp:ListItem>MandatoryWE</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            			 <asp:TemplateField HeaderText="AskType" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID = "lblAsk" runat="server" Text='<%# Eval("AskType") %>'></asp:Label>
                    <asp:DropDownList ID="ddlAsk" runat="server" Visible = "false" Value = "No" >
                    <asp:ListItem>NA</asp:ListItem>
                     <asp:ListItem>No</asp:ListItem>
                     <asp:ListItem>Yes</asp:ListItem>
                     <asp:ListItem>NE</asp:ListItem>
                     
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        <asp:TemplateField HeaderText="ChargedHours" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label12" runat="server" Text='<%# Eval("ChargedHours") %>'></asp:Label>
                <asp:TextBox ID="TxtCharged" runat="server" Text='<%# Eval("ChargedHours") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="WorkedHours" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label13" runat="server" Text='<%# Eval("WorkedHours") %>'></asp:Label>
                <asp:TextBox ID="TxtWorked" runat="server" Text='<%# Eval("WorkedHours") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Comments" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label14" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                <asp:TextBox ID="TxtComments" runat="server" Text='<%# Eval("Comments") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Bldg" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label15" runat="server" Text='<%# Eval("Bldg") %>'></asp:Label>
                <asp:TextBox ID="TxtBldg" runat="server" Text='<%# Eval("Bldg") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label16" runat="server" Text='<%# Eval("Crew") %>'></asp:Label>
                <asp:TextBox ID="TxtCrew" runat="server" Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="Label17" runat="server" Text='<%# Eval("PlantDate") %>'></asp:Label>
                <asp:TextBox ID="TxtPlantDate" runat="server" Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
   
    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick = "Update" Visible = "false"/>
    </form>
</body>
</html>
