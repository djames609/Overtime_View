<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CrewDetails.aspx.vb" Inherits="CrewDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Data</title>
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
    <table>
     <tr>
            <td>
                <b>ID</b></td>
            <td>
               
                <asp:TextBox ID="TxtID" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Name</b></td>
            <td>
               
                <asp:TextBox ID="txtName" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Username</b>
            </td>
            <td>
                
                <asp:TextBox ID="txtUser" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        
         <tr>
            <td>
                <b>Classification</b>
            </td>
            <td>
                
                <asp:TextBox ID="txtClass" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Bldg</b>
            </td>
            <td>
                
                <asp:DropDownList ID="ddBldg" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Bldg" DataValueField="Bldg">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
                    SelectCommand="SELECT distinct Bldg FROM t_Employee_OT Order by Bldg"></asp:SqlDataSource>
                
               
            </td>
        </tr>
        <tr>
            <td>
                <b>Crew</b>
            </td>
            <td>
                
                <asp:DropDownList ID="DdCrew" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Crew" DataValueField="Crew">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
                    SelectCommand="Select Distinct Crew from t_Employee_OT order by Crew">
                </asp:SqlDataSource>
                
               
            </td>
        </tr>
        <tr>
            <td>
                <b>PlantDate</b>
            </td>
            <td>
                
                <asp:TextBox ID="txtPlantDate" runat="server" ReadOnly = "false"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <b>Phone</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtPhone" runat="server" ReadOnly = "false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Status</b>
            </td>
            <td>
                
                <asp:DropDownList ID="ddStatus" runat="server">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td>
                <b></b>
            </td>
            <td>
                
                <asp:Button ID="BtnUpdate" runat="server" Text="Update Crew Data" />
            </td>
            
                
              </tr>
    </table>
    </form>
</body>
</html>
