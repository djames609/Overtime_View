Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class EmployeeHourView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim conString As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim query As String = "SELECT Emp_Name, Person_ID, Date, Dept, WorkedHours FROM t_manual_worked_52 "

        Dim condition As String = String.Empty
        For Each item As ListItem In lstCountries.Items
            condition += If(item.Selected, String.Format("'{0}',", item.Value), "")
        Next

        If Not String.IsNullOrEmpty(condition) Then
            condition = String.Format(" WHERE Person_ID IN ({0}) and Year(Date) = Year(GETDATE()) Order by Date Desc", condition.Substring(0, condition.Length - 1))
        End If

        Using con As New SqlConnection(conString)
            Using cmd As New SqlCommand(query & condition)
                Using sda As New SqlDataAdapter(cmd)
                    cmd.Connection = con
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub Country_Selected(sender As Object, e As EventArgs) Handles lstCountries.SelectedIndexChanged
        Me.BindGrid()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
