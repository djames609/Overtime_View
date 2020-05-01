Imports System.Data
Imports System.Data.SqlClient

Partial Class OTInfoList
    Inherits System.Web.UI.Page
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM t_Hours_Overtime WHERE ID = @ID")
                cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Close()
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        Me.BindGrid()
    End Sub
    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso GridView1.EditIndex <> e.Row.RowIndex Then
            TryCast(e.Row.Cells(0).Controls(0), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGrid()

        End If
    End Sub
    Private Sub BindGrid()
        Dim SelectCrew As String = Request.QueryString("Crews")
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand((Convert.ToString("SELECT ID,  Name, Username, Bldg, Crew, PlantDate, DateEntered, OvertimeType, AskType, ChargedHours, WorkedHours, Comments FROM t_Hours_Overtime Where Crew in (") & SelectCrew + ")Order by Crew"))
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
