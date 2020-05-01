<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cutoffdisplay.aspx.vb" Inherits="cutoffdisplay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Button ID="Button5" runat="server" Text="Home" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            >
             <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           />
                    
        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          />
         <Columns>
         
          <asp:TemplateField HeaderText="Name" ItemStyle-Width = "150"  >
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Size="10pt" Text='<%# Eval("Name") %>'></asp:Label>
                    <asp:TextBox ID="TxtName" runat="server" ReadOnly = "True" Text='<%# Eval("Name") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "100" >
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Font-Size="10pt" Text='<%# Eval("Crew") %>'></asp:Label>
                    <asp:TextBox ID="Txtcrew" runat="server" ReadOnly = "True" Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PlantDate"  ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text='<%# Eval("PlantDate") %>'></asp:Label>
                    <asp:TextBox ID="TxtPltDate" runat="server" ReadOnly = "True" Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DateEntered" ItemStyle-Width = "50">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text='<%# Eval("DateEntered") %>'></asp:Label>
                    <asp:TextBox ID="TxtPltDate" runat="server" ReadOnly = "True" Text='<%# Eval("DateEntered") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charged Hours" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Font-Size="10pt" Text='<%# Eval("ChargedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtChgHrs" runat="server" ReadOnly = "True" Text='<%# Eval("ChargedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Worked Hours" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Font-Size="10pt" Text='<%# Eval("TotalWorkHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtWorkHrs" runat="server" ReadOnly = "True" Text='<%# Eval("TotalWorkHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:BoundField DataField="Day1" ItemStyle-Width = "70" HeaderText="Day1 Early/Over"/>
           <asp:BoundField DataField="Day2" ItemStyle-Width = "70" HeaderText="Day2 Early/Over"/>
           <asp:BoundField DataField="Day3" ItemStyle-Width = "70" HeaderText="Day3 Early/Over"/>
           <asp:BoundField DataField="Day4" ItemStyle-Width = "70" HeaderText="Day4 Early/Over"/>
           <asp:BoundField DataField="Day5" ItemStyle-Width = "70" HeaderText="Day5 Early/Over"/>
           <asp:BoundField DataField="Day6" ItemStyle-Width = "70" HeaderText="Day6 Saturday"/>
           <asp:BoundField DataField="Day7" ItemStyle-Width = "65" HeaderText="Day7 Sunday   "/>
             
           
       </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT Name, Username, Bldg, Crew, PlantDate, TotalChargedHours, TotalWorkHours, TotalMandatoryRefuseCount FROM t_Hours_Overtime_Total">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
