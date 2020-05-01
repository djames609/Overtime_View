<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OTDetailsList.aspx.vb" Inherits="OTDetailsList" %>

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
                
                <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Bldg</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtBldg" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Crew</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtCrew" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <b>PlantDate</b>
            </td>
            <td>
                
                <asp:TextBox ID="txtPlantDate" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>DateEntered</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtDateEntered" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Overtime Type</b>
            </td>
            <td>
                
                <asp:DropDownList ID="ddOTType" runat="server" 
                     DataTextField="OvertimeType" DataValueField="OvertimeType">
                    <asp:ListItem>Early</asp:ListItem>
                     <asp:ListItem>Over</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                     <asp:ListItem>MandatoryWD</asp:ListItem>
                     <asp:ListItem>MandatoryWE</asp:ListItem>
                </asp:DropDownList>
                
                
               
            </td>
        </tr>
        <tr>
            <td>
                <b>AskType</b>
            </td>
            <td>
                
                <asp:DropDownList ID="ddAskType" runat="server" 
                     DataTextField="AskType" DataValueField="AskType">
                    <asp:ListItem>NA</asp:ListItem>
                     <asp:ListItem>No</asp:ListItem>
                     <asp:ListItem>Yes</asp:ListItem>
                     <asp:ListItem>NE</asp:ListItem>
                </asp:DropDownList>
                
                
               
            </td>
        </tr>
        <tr>
            <td>
                <b>ChargedHours</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtChargedHours" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>WorkedHours</b>
            </td>
            <td>
                
                <asp:TextBox ID="txtWorkedHours" runat="server" ReadOnly = "false"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <b>Comments</b>
            </td>
            <td>
                
                <asp:TextBox ID="TxtComments" runat="server" ></asp:TextBox>
            </td>
        </tr>       
        <tr>
        <td>
            <asp:Button ID="BtnUpdate" runat="server" Text="Update" />
        </td>        
        </tr>           
    </table>
    </form>
</body>
</html>
