Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class EmployeeHourView112
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim conString As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim query As String = "SELECT Distinct tmw52.Emp_Name, tmw52.Person_ID, tmw52.Date, tmw52.Dept, tmw52.WorkedHours, tho.ChargedHours FROM t_manual_worked_52 tmw52 Left Outer join t_Hours_Overtime tho on tmw52.Date = tho.DateEntered and tmw52.Person_ID = tho.Username"

       

        Dim condition As String = String.Empty
        For Each item As ListItem In lstEmployee.Items
            condition += If(item.Selected, String.Format("'{0}',", item.Value), "")
        Next

        If Not String.IsNullOrEmpty(condition) Then
            condition = String.Format(" WHERE tmw52.Person_ID IN ({0}) and tmw52.WorkedHours > 0 Order by tmw52.Date Desc", condition.Substring(0, condition.Length - 1))
        End If

        Using con As New SqlConnection(conString)
            Using cmd As New SqlCommand(query & condition)
                Using sda As New SqlDataAdapter(cmd)
                    cmd.Connection = con
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                        Dim total As Decimal = dt.AsEnumerable().Sum(Function(row) row.Field(Of Decimal)("WorkedHours"))
                        GridView1.FooterRow.Cells(3).Text = "WorkedHours"
                        GridView1.FooterRow.Cells(3).HorizontalAlign = HorizontalAlign.Right
                        GridView1.FooterRow.Cells(4).Text = total.ToString("N2")
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub Employee_Selected(sender As Object, e As EventArgs) Handles lstEmployee.SelectedIndexChanged
        Me.BindGrid()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
