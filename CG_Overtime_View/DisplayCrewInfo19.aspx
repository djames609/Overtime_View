<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DisplayCrewInfo19.aspx.vb" Inherits="DisplayCrewInfo19" %>

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
    <asp:Button ID="Button1" runat="server" Text="Bldg 19 CREWS" />  
     
<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server" AutoGenerateColumns="false" ShowFooter="true" 
        Font-Size="Small">
<AlternatingRowStyle BackColor="White" ForeColor="#000000"></AlternatingRowStyle>
    <Columns>
            
       
            
         <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100" />
      
       
        <asp:BoundField DataField="Crew" HeaderText="Crew" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" ItemStyle-Width="140" />
       
         
        <asp:BoundField DataField="DateChanged" HeaderText="DateChanged" ItemStyle-Width="140" >        
        

        </asp:BoundField>
         
        
       
    </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#A1DCF2"></RowStyle>
</asp:GridView>
 
    <br />
     
<asp:GridView ID="GridView2" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server"  AutoGenerateColumns="false" ShowFooter="true" 
        Font-Size="Small">
    <Columns>
    
            
       
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100" />
      
       
        <asp:BoundField DataField="Crew" HeaderText="Crew" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" ItemStyle-Width="140" />
      
         
        <asp:BoundField DataField="DateChanged" HeaderText="DateChanged" ItemStyle-Width="140" >        
        

        </asp:BoundField>
         
        
       
    </Columns>
</asp:GridView>
    <br />
     
<asp:GridView ID="GridView3" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
    runat="server"  AutoGenerateColumns="false" ShowFooter="true" 
        Font-Size="Small">
    <Columns>
    
            
        
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-Width="100" />
      
        
        <asp:BoundField DataField="Crew" HeaderText="Crew" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PlantDate" HeaderText="PlantDate" ItemStyle-Width="140" />
      
         
     
        <asp:BoundField DataField="DateChanged" HeaderText="DateChanged" ItemStyle-Width="140" >        
        

        </asp:BoundField>
         
       
    </Columns>
</asp:GridView>
 
    <br />
     
 <br />
 
    </form>


    </body>
</html>
