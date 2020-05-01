<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PrintAskListWD.aspx.vb" Inherits="PrintAskListWD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="Button5" runat="server" Text="Home" />
        &nbsp;&nbsp; Mandatory Worked Hours Sorted&nbsp; by Worked Hours then 
        Seniority-WeekEnd<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            AllowSorting="True"  >
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
            <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "30" >
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Font-Size="10pt" Text='<%# Eval("Crew") %>'></asp:Label>
                    <asp:TextBox ID="Txtcrew" runat="server" ReadOnly = "True" Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PlantDate"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Size="10pt" Text='<%# Eval("PlantDate") %>'></asp:Label>
                    <asp:TextBox ID="TxtPltDate" runat="server" ReadOnly = "True" Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charged Hours"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Font-Size="10pt" Text='<%# Eval("TotalChargedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtChgHrs" runat="server" ReadOnly = "True" Text='<%# Eval("TotalChargedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Worked Hours"   ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Font-Size="10pt" Text='<%# Eval("TotalWorkHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtWorkHrs" runat="server" ReadOnly = "True" Text='<%# Eval("TotalWorkHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WD" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Font-Size="10pt" Text='<%# Eval("TotalMandatoryRefuseCountWD") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWD" runat="server" ReadOnly = "True" Text='<%# Eval("TotalMandatoryRefuseCountWD") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WE" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Font-Size="10pt" Text='<%# Eval("TotalMandatoryRefuseCountWE") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWE" runat="server" ReadOnly = "True" Text='<%# Eval("TotalMandatoryRefuseCountWE") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="ThisWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Font-Size="10pt" Text='<%# Eval("ThisWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtThisWeek" runat="server" ReadOnly = "True" Text='<%# Eval("ThisWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="NextWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Font-Size="10pt" Text='<%# Eval("NextWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtNextWeek" runat="server" ReadOnly = "True" Text='<%# Eval("NextWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 2 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop2Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtTwoWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop2Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 3 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop3Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtThreeWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop3Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
       </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT Name, Username, Bldg, Crew, PlantDate, TotalChargedHours, TotalWorkHours, TotalMandatoryRefuseCount FROM t_Hours_Overtime_Total">
        </asp:SqlDataSource>
    
        <br />
        Mandatory Worked Hours Sorted by Seniority then Hours Worked-WeekDay<br />
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            AllowSorting="True"  >
             <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           />
                    
        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          />
         <Columns>
         
          <asp:TemplateField HeaderText="Name" ItemStyle-Width = "150"  >
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("Name") %>'></asp:Label>
                    <asp:TextBox ID="TxtName0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("Name") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "30" >
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("Crew") %>'></asp:Label>
                    <asp:TextBox ID="Txtcrew0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PlantDate"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("PlantDate") %>'></asp:Label>
                    <asp:TextBox ID="TxtPltDate0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charged Hours"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalChargedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtChgHrs0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalChargedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Worked Hours"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalWorkHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtWorkHrs0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalWorkHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WD" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWD") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWD0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWD") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WE" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWE") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWE0" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWE") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="ThisWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label18" runat="server" Font-Size="10pt" Text='<%# Eval("ThisWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtThisWeek" runat="server" ReadOnly = "True" Text='<%# Eval("ThisWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="NextWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label19" runat="server" Font-Size="10pt" Text='<%# Eval("NextWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtNextWeek" runat="server" ReadOnly = "True" Text='<%# Eval("NextWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 2 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label20" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop2Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtTwoWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop2Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 3 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label21" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop3Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtThreeWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop3Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
       </Columns>
        </asp:GridView>
    
    </div>
    <br />
    Charged Hours-Current<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            AllowSorting="True"  >
             <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           />
                    
        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          />
         <Columns>
         
          <asp:TemplateField HeaderText="Name" ItemStyle-Width = "150"  >
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("Name") %>'></asp:Label>
                    <asp:TextBox ID="TxtName1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("Name") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Crew" ItemStyle-Width = "30" >
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("Crew") %>'></asp:Label>
                    <asp:TextBox ID="Txtcrew1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("Crew") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PlantDate"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label16" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("PlantDate") %>'></asp:Label>
                    <asp:TextBox ID="TxtPltDate1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("PlantDate") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charged Hours"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalChargedHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtChgHrs1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalChargedHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Worked Hours"  ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label18" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalWorkHours") %>'></asp:Label>
                    <asp:TextBox ID="TxtWorkHrs1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalWorkHours") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WD" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label19" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWD") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWD1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWD") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Refuse Count WE" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label20" runat="server" Font-Size="10pt" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWE") %>'></asp:Label>
                    <asp:TextBox ID="TxtRefCountWE1" runat="server" ReadOnly = "True" 
                        Text='<%# Eval("TotalMandatoryRefuseCountWE") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField HeaderText="ThisWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label38" runat="server" Font-Size="10pt" Text='<%# Eval("ThisWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtThisWeek" runat="server" ReadOnly = "True" Text='<%# Eval("ThisWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="NextWeek" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label39" runat="server" Font-Size="10pt" Text='<%# Eval("NextWeek") %>'></asp:Label>
                    <asp:TextBox ID="TxtNextWeek" runat="server" ReadOnly = "True" Text='<%# Eval("NextWeek") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 2 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label30" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop2Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtTwoWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop2Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Will Drop 3 Wks" ItemStyle-Width = "30">
                <ItemTemplate>
                    <asp:Label ID="Label31" runat="server" Font-Size="10pt" Text='<%# Eval("WillDrop3Wks") %>'></asp:Label>
                    <asp:TextBox ID="TxtThreeWeeksAgo" runat="server" ReadOnly = "True" Text='<%# Eval("WillDrop3Wks") %>' Visible="false"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
       </Columns>
        </asp:GridView>
    
    <p>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="WeekStarting" HeaderText="WeekStarting" 
                    SortExpression="WeekStarting" />
                <asp:BoundField DataField="OTMandated" HeaderText="OTMandated if Worked Hours is Less Than" 
                    SortExpression="OTMandated" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT * FROM [t_mandated_hours]"></asp:SqlDataSource>
    </p>
    
    </form>
</body>
</html>
