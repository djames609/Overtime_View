
Partial Class cutoffOT
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim value As String = String.Empty
        For Each item As ListItem In Lbcrew.Items
            If item.Selected Then
                value += "'" + item.Text + "',"
            End If
        Next

        Response.Redirect("cutoffdisplay.aspx?Crews=" + value.Remove(value.Length - 1) + "&cutoff=" + ddcutoff.Text)
    End Sub
End Class
