Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class EmployeeHourView102
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim conString As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim query As String = "SELECT DISTINCT Emp_Name, Person_ID, Date, Dept, WorkedHours FROM t_manual_worked_52 "

        Dim condition As String = String.Empty
        For Each item As ListItem In lstEmployee.Items
            condition += If(item.Selected, String.Format("'{0}',", item.Value), "")
        Next

        If Not String.IsNullOrEmpty(condition) Then
            condition = String.Format(" WHERE Person_ID IN ({0}) Order by Date Desc", condition.Substring(0, condition.Length - 1))
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
