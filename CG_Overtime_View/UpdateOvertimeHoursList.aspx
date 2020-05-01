<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UpdateOvertimeHoursList.aspx.vb" Inherits="UpdateOvertimeHoursList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> AddOvertime</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {
         $('.actualin').datepicker({
             dateFormat: 'mm-dd-yy',
             onSelect: function (datetext) {

                 var d = new Date(); // for now
                


                 $('.actualin').val(datetext);
             }
         });
     });
      
     </script>  
     <style type = "text/css">
    input[type=text], select{background-color:#FFFFD2; border:1px solid #ccc}
    </style>
</head>
<body style = "font-family:Arial;font-size:10pt">
    <form id="form1" runat="server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
        SelectCommand="SELECT DISTINCT crew FROM t_Employee_Overtime">
    </asp:SqlDataSource>
     <asp:Button ID="Button2" runat="server" Text="Update" OnClick = "Update" Visible = "True"/>
         <asp:Button ID="Button3" runat="server" Text="Home" />
    <asp:GridView ID="gvOT" runat="server" AutoGenerateColumns="false" OnRowDataBound = "OnRowDataBound" DataKeyNames = "ID">
    <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           />
                    
        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          />
        <Columns>
        
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID = "chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmployeeName" ItemStyle-Width = "150">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    <asp:TextBox ID="TxtName" runat="server" ReadOnly = "True" Text='<%# Eval("Name") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmployeeID" ItemStyle-Width = "150">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    <asp:TextBox ID="TxtID" runat="server" ReadOnly = "True" Text='<%# Eval("Username") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="DateAsked" ItemStyle-Width = "150">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("DateEntered") %>'></asp:Label>
                    <asp:TextBox ID="TxtDateEntered" runat="server" class="actualin" ReadOnly = "False"  Text='<%# Eval("DateEntered") %>' Visible="false"></asp:TextBox>
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
            <asp:TemplateField HeaderText="ChargedHours" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("ChargedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtChgHours" runat="server" Text='<%# Eval("ChargedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="WorkedHours" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("WorkedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtWorkHours" runat="server" Text='<%# Eval("WorkedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Comments" ItemStyle-Width = "450">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                    <asp:TextBox ID="TxtComments" runat="server" Text='<%# Eval("Comments") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Bldg" ItemStyle-Width = "150">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Bldg") %>'></asp:Label>
                    <asp:TextBox ID="TxtBldg" runat="server" ReadOnly = "True" Text='<%# Eval("Bldg") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "150">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Crew") %>'></asp:Label>
                    <asp:TextBox ID="TxtCrew" runat="server" ReadOnly = "True" Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="PlantDate" ItemStyle-Width = "100">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("PlantDate") %>'></asp:Label>
                    <asp:TextBox ID="TxtPlantDate" runat="server" ReadOnly = "True"  Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Columns>
    </asp:GridView>
    <br />
  
    <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick = "Update" Visible = "True"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Home" />
    </form>
</body>
</html>
