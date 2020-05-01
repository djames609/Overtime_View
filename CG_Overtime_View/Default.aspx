<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    var selected_tab = 1;
    $(function () {
        var tabs = $("#tabs").tabs({
            select: function (e, i) {
                selected_tab = i.index;
            }
        });
        selected_tab = $("[id$=selected_tab]").val() != "" ? parseInt($("[id$=selected_tab]").val()) : 0;
        tabs.tabs('select', selected_tab);
        $("form").submit(function () {
            $("[id$=selected_tab]").val(selected_tab);
        });
    });
   
</script>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Bldg 6</a></li>
        <li><a href="#tabs-2">Bldg 7</a></li>
        <li><a href="#tabs-3">Bldg 17</a></li>
        <li><a href="#tabs-4">Bldg 19</a></li>
        <li><a href="#tabs-5">Bldg 25</a></li>
        <li><a href="#tabs-6">Bldg 110</a></li>
       
        <li><a href="#tabs-7">Bldg 112</a></li>
         <li><a href="#tabs-8">WH</a></li>
         <li><a href="#tabs-9">102</a></li>
         <li><a href="#tabs-10">Crews</a></li>
    </ul>
    <div id="tabs-1">
        Crew 6<asp:ListBox 
            ID="Lbcrews6" runat="server" 
            DataSourceID="SqlDataSource1" SelectionMode="Multiple" 
            DataTextField="Crew" DataValueField="Crew" Width="95px">
        </asp:ListBox>
        <asp:Button ID="Button2" runat="server" Text="Select All
        " Height="21px" Width="102px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        For Charged Hours Only-Cutoff Date
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 6') AND (Status &lt;&gt; 'Inactive') ORDER BY Crew">
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddcutoff6" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select Sundate from t_OT_Cutoff order by Sundate">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select Sundate from t_OT_Cutoff order by Sundate">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6b" runat="server" Text="Charged Hours" 
            Width="154px" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6e" runat="server" Text="Worked/Charged Hours" 
            Width="166px" />
        &nbsp;&nbsp;
        &nbsp;
        <asp:Button ID="Button6c" runat="server" Text="Display Hours" 
            Width="195px" />
    &nbsp;
        <asp:Button ID="Button6d" runat="server" Text="View Employee Hours" />
        </div>
    <div id="tabs-2">
        Crew 7<asp:ListBox ID="Lbcrews7" runat="server" SelectionMode="Multiple"
            DataSourceID="SqlDataSource2" DataTextField="Crew" DataValueField="Crew" 
            Width="118px">
        </asp:ListBox>
        <asp:Button ID="Button6" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; For 
        Charged Hours Only-Cutoff Date
        <asp:DropDownList ID="ddcutoff7" runat="server" DataSourceID="SqlDataSource13" 
            DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 7') AND (Status &lt;&gt; 'Inactive') ORDER BY Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7b" runat="server" Text="Charged Hours" 
            Width="156px" />
&nbsp;&nbsp;<asp:Button ID="Button7e" runat="server" Text="Worked/Charged Hours" 
            Width="171px" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7c" runat="server" Text="Display Hours" 
            Width="158px" />
    &nbsp;
        <asp:Button ID="Button14" runat="server" Text="View Employee Hours" />
        </div>
    <div id="tabs-3">
       Crew 17<asp:ListBox ID="Lbcrews17" runat="server" SelectionMode="Multiple"
            DataSourceID="SqlDataSource3" DataTextField="Crew" DataValueField="Crew" 
            Height="137px">
        </asp:ListBox>
        <asp:Button ID="Button7" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        For Charged Hours Only-Cutoff Date
&nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            
            
            SelectCommand="SELECT DISTINCT Crew FROM t_OT_Bldg_Crew  WHERE (Bldg = 'Building 17') ORDER BY Crew">
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddcutoff17" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button17b" runat="server" Text="Charged Hours" 
            Width="157px"/>
&nbsp;&nbsp;&nbsp;<asp:Button ID="Button17e" runat="server" 
            Text="Worked/Charged Hours" Width="168px"  />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button17c" runat="server" Text="Display Hours" 
            Width="172px" />
    &nbsp;
        <asp:Button ID="Button15" runat="server" Text="View Employee Hours" />
        </div>
    <div id="tabs-4">
       Crew 19<asp:ListBox ID="Lbcrews19" runat="server" SelectionMode="Multiple"
            DataSourceID="SqlDataSource4" DataTextField="Crew" DataValueField="Crew" 
            Width="103px">
        </asp:ListBox>
        <asp:Button ID="Button8" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        For Charged Hours Only-Cutoff Date&nbsp;
        <asp:DropDownList ID="ddcutoff19" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 19') AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button19b" runat="server" Text="Charged Hours" 
            Width="161px" />
&nbsp;&nbsp;
        <asp:Button ID="Button19e" runat="server" Text="Worked/Charged Hours" 
            Width="167px" />
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button19c" runat="server" Text="Display Hours
" Width="168px" />
    &nbsp;
        <asp:Button ID="Button16" runat="server" Text="View Employee Hours" />
        </div>
     <div id="tabs-5">
       Crew 25<asp:ListBox ID="LbCrews25" runat="server" SelectionMode="Multiple"
             DataSourceID="SqlDataSource5" DataTextField="Crew" DataValueField="Crew" 
             Width="119px">
         </asp:ListBox>
         <asp:Button ID="Button9" runat="server" Text="Select All
        " Height="21px" Width="102px" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For 
         Charged Hours Only-Cutoff Date
         <asp:DropDownList ID="ddcutoff25" runat="server" 
             DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
         </asp:DropDownList>
         &nbsp;<asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 25') AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button25b" runat="server" Text="Charged Hours" 
             Width="166px"/>
&nbsp;&nbsp;<asp:Button ID="Button25e" runat="server" Text="Worked/Charged Hours" 
             Width="171px" />
         &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button25c" runat="server" Text="Display Hours" 
             Width="168px" />
    &nbsp;
         <asp:Button ID="Button17" runat="server" Text="View Employee Hours" />
         </div>
    <div id="tabs-6">
       Crew 110
       <asp:ListBox ID="Lbcrews110" runat="server" DataSourceID="SqlDataSource6" AutoPostBack="false"
        SelectionMode="Multiple" DataTextField="Crew" DataValueField="Crew" 
            Height="139px" Width="132px"></asp:ListBox>
        <asp:Button ID="Button10" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For Charged 
        Hours Only-Cutoff Date
        <asp:DropDownList ID="ddcutoff110" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 110') and Crew is not null AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button110b" runat="server" Text="Charged Hours" 
            Width="139px"/>
&nbsp;&nbsp;<asp:Button ID="Button110e" runat="server" Text="Worked/Charged Hours" 
            Width="161px"  />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button110c" runat="server" Text="Display Hours" 
            style="margin-top: 0px" Width="160px" />
    &nbsp;
        <asp:Button ID="Button18" runat="server" Text="View Employee Hours" />
        </div>
   
     <div id="tabs-7">
       Crew 112
       <asp:ListBox ID="LbCrews112" runat="server" DataSourceID="SqlDataSource8" AutoPostBack="false"
        SelectionMode="Multiple" DataTextField="Crew" DataValueField="Crew" 
             Height="180px" Width="179px"></asp:ListBox>
        <asp:Button ID="Button11" runat="server" Text="Select All
        " Height="21px" Width="102px" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For 
         Charged Hours Only-Cutoff Date
         <asp:DropDownList ID="ddcutoff112" runat="server" 
             DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
         </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 112')  AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button112b" runat="server" Text="Charged Hours" 
             Width="148px" />
&nbsp;&nbsp;&nbsp;<asp:Button ID="Button112e" runat="server" 
             Text="Worked/Charged Hours" Width="161px" />
         &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button112c" runat="server" Text="Display Hours" 
             Width="157px" />
    &nbsp;
         <asp:Button ID="Button19" runat="server" Text="View Employee Hours" />
         </div>
    <div id="tabs-8">
       Crew WH<asp:ListBox ID="LbWH" runat="server" 
            DataSourceID="SqlDataSource9"  SelectionMode="Multiple" 
            DataTextField="Crew" DataValueField="Crew" Height="76px" Width="153px"></asp:ListBox>
            <asp:Button ID="Button12" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For 
        Charged Hours Only-Cutoff Date
        <asp:DropDownList ID="ddcutoff26" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="SELECT DISTINCT Crew FROM t_Employee_OT WHERE (Bldg = 'Building 26') AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button26b" runat="server" Text="Charged Hours" 
            Width="149px"/>
&nbsp;&nbsp;<asp:Button ID="Button26e" runat="server" Text="Worked/Charged Hours" 
            Width="163px"  />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button26c" runat="server" 
            Text="Display Hours" Width="157px" />
    &nbsp;
        <asp:Button ID="Button20" runat="server" Text="View Employee Hours" />
        </div>
    <div id="tabs-9">
       Crew 102<asp:ListBox ID="Lbcrews102" runat="server"  SelectionMode="Multiple" 
            DataTextField="Crew" DataValueField="Crew" DataSourceID="SqlDataSource10" 
            Height="111px" Width="110px"></asp:ListBox>
            <asp:Button ID="Button13" runat="server" Text="Select All
        " Height="21px" Width="102px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For 
        Charged Hours Only-Cutoff Date
        <asp:DropDownList ID="ddcutoff102" runat="server" 
            DataSourceID="SqlDataSource13" DataTextField="Sundate" DataValueField="Sundate">
        </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select distinct Crew from t_Employee_OT where (Bldg = 'Building 102') AND (Status &lt;&gt; 'Inactive') Order by Crew">
        </asp:SqlDataSource>
&nbsp;<br />
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button102b" runat="server" Text="Charged" 
            Width="156px"/>
&nbsp;&nbsp;<asp:Button ID="Button102e" runat="server" Text="Worked/Charged" 
            Width="162px" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button102c" runat="server" Text="Display Hours" 
            Width="160px" />
    &nbsp;
        <asp:Button ID="Button21" runat="server" Text="View Employee Hours" />
        </div>
    <div id="tabs-10">
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select Distinct Bldg from t_employee_ot order by Bldg">
        </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CG_ITConnectionString %>" 
            SelectCommand="Select Distinct Bldg from t_Employee_OT order by Bldg">
        </asp:SqlDataSource>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="Button5" runat="server" Text="Display Building Crews" />
    </div>
</div>
<asp:HiddenField ID="selected_tab" runat="server" />
    <br />
    
    <br />
    <br />
<asp:Button ID="Button1" runat="server" Text="Do PostBack" />
        
 
</asp:Content>
