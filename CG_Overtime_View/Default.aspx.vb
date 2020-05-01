Imports System.Data
Imports System.Linq
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Lbcrews6.SelectedValue = "B6-J"
            Lbcrews7.SelectedValue = "B7-Q"
            Lbcrews17.SelectedValue = "B17-Auto_A"
            Lbcrews19.SelectedValue = "B19-A"
            LbCrews25.SelectedValue = "B25-U"
            Lbcrews110.SelectedValue = "B110-A_3229"
            Lbcrews102.SelectedValue = "B102-1"
            LbCrews112.SelectedValue = "B112-3A Days/Afts"
            LbWH.SelectedValue = "Warehouse_111340"

        End If
    End Sub
    

    Protected Sub Button6b_Click(sender As Object, e As System.EventArgs) Handles Button6b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews6.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff6.Text)
    End Sub

    

    Protected Sub Button7b_Click(sender As Object, e As System.EventArgs) Handles Button7b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews7.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff7.Text)
    End Sub

    Protected Sub Button6c_Click(sender As Object, e As System.EventArgs) Handles Button6c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews6.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    Protected Sub Button7c_Click(sender As Object, e As System.EventArgs) Handles Button7c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews7.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button17b_Click(sender As Object, e As System.EventArgs) Handles Button17b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews17.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff17.Text)
    End Sub

    Protected Sub Button17c_Click(sender As Object, e As System.EventArgs) Handles Button17c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews17.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button19b_Click(sender As Object, e As System.EventArgs) Handles Button19b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews19.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff19.Text)
    End Sub

    Protected Sub Button19c_Click(sender As Object, e As System.EventArgs) Handles Button19c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews19.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button25b_Click(sender As Object, e As System.EventArgs) Handles Button25b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews25.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff25.Text)
    End Sub

    Protected Sub Button25c_Click(sender As Object, e As System.EventArgs) Handles Button25c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews25.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    
    

    Protected Sub Button110b_Click(sender As Object, e As System.EventArgs) Handles Button110b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews110.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff110.Text)
    End Sub

    Protected Sub Button110c_Click(sender As Object, e As System.EventArgs) Handles Button110c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews110.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    
   

    

   

    Protected Sub Button112b_Click(sender As Object, e As System.EventArgs) Handles Button112b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews112.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff112.Text)
    End Sub

    Protected Sub Button112c_Click(sender As Object, e As System.EventArgs) Handles Button112c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews112.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button26b_Click(sender As Object, e As System.EventArgs) Handles Button26b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbWH.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff26.Text)
    End Sub

    Protected Sub Button26c_Click(sender As Object, e As System.EventArgs) Handles Button26c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbWH.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   
    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Dim li As ListItem


        For Each li In Lbcrews6.Items
            li.Selected = True
        Next
    End Sub

    

    Protected Sub Button102b_Click(sender As Object, e As System.EventArgs) Handles Button102b.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews102.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff102.Text)
    End Sub

    Protected Sub Button102c_Click(sender As Object, e As System.EventArgs) Handles Button102c.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews102.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("EditOTHours.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button6e_Click(sender As Object, e As System.EventArgs) Handles Button6e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews6.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button7e_Click(sender As Object, e As System.EventArgs) Handles Button7e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews7.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button17e_Click(sender As Object, e As System.EventArgs) Handles Button17e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews17.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button19e_Click(sender As Object, e As System.EventArgs) Handles Button19e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews19.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button25e_Click(sender As Object, e As System.EventArgs) Handles Button25e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews25.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button110e_Click(sender As Object, e As System.EventArgs) Handles Button110e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews110.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button112e_Click(sender As Object, e As System.EventArgs) Handles Button112e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbCrews112.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button26e_Click(sender As Object, e As System.EventArgs) Handles Button26e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In LbWH.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

    

    Protected Sub Button102e_Click(sender As Object, e As System.EventArgs) Handles Button102e.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrews102.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("PrintAskListWD.aspx?Crews=" + value.Remove(value.Length - 1))
    End Sub

   

    Protected Sub Button6_Click(sender As Object, e As System.EventArgs) Handles Button6.Click
        Dim li As ListItem


        For Each li In Lbcrews7.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click
        Dim li As ListItem


        For Each li In Lbcrews17.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button8_Click(sender As Object, e As System.EventArgs) Handles Button8.Click
        Dim li As ListItem


        For Each li In Lbcrews19.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button9_Click(sender As Object, e As System.EventArgs) Handles Button9.Click
        Dim li As ListItem


        For Each li In LbCrews25.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button10_Click(sender As Object, e As System.EventArgs) Handles Button10.Click
        Dim li As ListItem


        For Each li In Lbcrews110.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button11_Click(sender As Object, e As System.EventArgs) Handles Button11.Click
        Dim li As ListItem


        For Each li In LbCrews112.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button12_Click(sender As Object, e As System.EventArgs) Handles Button12.Click
        Dim li As ListItem


        For Each li In LbWH.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button13_Click(sender As Object, e As System.EventArgs) Handles Button13.Click
        Dim li As ListItem


        For Each li In Lbcrews102.Items
            li.Selected = True
        Next
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Response.Redirect("GetCrews.aspx")
    End Sub

    
   

    

   

    

    

    

   

   

    
    Protected Sub Button6d_Click(sender As Object, e As System.EventArgs) Handles Button6d.Click
        Response.Redirect("EmployeeHourView6.aspx")
    End Sub

    Protected Sub Button14_Click(sender As Object, e As System.EventArgs) Handles Button14.Click
        Response.Redirect("EmployeeHourView7.aspx")
    End Sub

    Protected Sub Button15_Click(sender As Object, e As System.EventArgs) Handles Button15.Click
        Response.Redirect("EmployeeHourView17.aspx")
    End Sub

    Protected Sub Button16_Click(sender As Object, e As System.EventArgs) Handles Button16.Click
        Response.Redirect("EmployeeHourView19.aspx")
    End Sub

    Protected Sub Button17_Click(sender As Object, e As System.EventArgs) Handles Button17.Click
        Response.Redirect("EmployeeHourView25.aspx")
    End Sub

    Protected Sub Button18_Click(sender As Object, e As System.EventArgs) Handles Button18.Click
        Response.Redirect("EmployeeHourView110.aspx")
    End Sub

    Protected Sub Button19_Click(sender As Object, e As System.EventArgs) Handles Button19.Click
        Response.Redirect("EmployeeHourView112.aspx")
    End Sub

    Protected Sub Button20_Click(sender As Object, e As System.EventArgs) Handles Button20.Click
        Response.Redirect("EmployeeHourView26.aspx")
    End Sub

    Protected Sub Button21_Click(sender As Object, e As System.EventArgs) Handles Button21.Click
        Response.Redirect("EmployeeHourView102.aspx")
    End Sub
End Class
