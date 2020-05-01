Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class EditOTHours
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim SelectCrew As String = Request.QueryString("Crews")
       
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand((Convert.ToString("SELECT ID, Name, Username, Convert(varchar, DateEntered, 101) as DateEntered, OvertimeType, AskType, ChargedHours, WorkedHours FROM t_Hours_Overtime   Where Crew in (") & SelectCrew) + ") Order by Year(DateEntered) DESC,  DateEntered DESC")
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
    Protected Sub OnRowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim name As String = (GridView1.DataKeys(e.RowIndex).Values(1))
        Dim username As String = (GridView1.DataKeys(e.RowIndex).Values(2))
        Dim dateentered As String = (GridView1.DataKeys(e.RowIndex).Values(3))
        Dim Overtimetype As String = TryCast(row.Cells(5).Controls(0), TextBox).Text
        Dim AskType As String = TryCast(row.Cells(6).Controls(0), TextBox).Text
        Dim ChargedHours As String = TryCast(row.Cells(7).Controls(0), TextBox).Text
        Dim WorkedHours As String = TryCast(row.Cells(8).Controls(0), TextBox).Text
        Dim Comments As String = TryCast(row.Cells(9).Controls(0), TextBox).Text
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("UPDATE t_Hours_Overtime SET Name = @Name, Username = @Username, DateEntered = @DateEntered, OvertimeType = @OvertimeType, AskType = @AskType, ChargedHours = @ChargedHours, WorkedHours = @WorkedHours, Comments = @Comments WHERE Id = @Id")
                cmd.Parameters.AddWithValue("@Id", Id)
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Username", username)
                cmd.Parameters.AddWithValue("@DateEntered", dateentered)
                cmd.Parameters.AddWithValue("@OvertimeType", Overtimetype)
                cmd.Parameters.AddWithValue("@AskType", AskType)
                cmd.Parameters.AddWithValue("@ChargedHours", ChargedHours)
                cmd.Parameters.AddWithValue("@WorkedHours", WorkedHours)
                cmd.Parameters.AddWithValue("@Comments", Comments)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub OnRowCancelingEdit(sender As Object, e As EventArgs)
        GridView1.EditIndex = -1
        Me.BindGrid()
    End Sub
    Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        Me.BindGrid()
    End Sub
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM t_Hours_Overtime WHERE Id = @Id")
                cmd.Parameters.AddWithValue("@Id", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindGrid()
    End Sub

   

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
