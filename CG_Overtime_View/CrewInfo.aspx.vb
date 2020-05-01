Imports System.Data
Imports System.Data.SqlClient

Partial Class CrewInfo
    Inherits System.Web.UI.Page
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM t_Employee_OT WHERE ID = @ID")
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
    Protected Sub Insert(sender As Object, e As EventArgs)
        Dim IsAdded As Boolean = False
        Dim Name As String = txtName.Text
        Dim Username As String = TxtUser.Text
        
        Dim Classification As String = TxtClass.Text
        Dim Bldg As String = Request.Form("ddBldg".ToString())
        Dim Crew As String = Request.Form("ddCrew".ToString())

        Dim PlantDate As String = txtPlantDate.Text
        Dim Phone As String = txtPhone.Text
        Dim Status As String = Request.Form("ddStatus".ToString())

        Dim DateChanged As String = Now
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using sqlCon As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                cmd.CommandText = "INSERT INTO T_Employee_OT VALUES (@Name, @Username, @Bldg, @Crew, @Classification, @PlantDate,  @Status, @Phone, @DateChanged)"
                cmd.Parameters.AddWithValue("@Name", Name)
                cmd.Parameters.AddWithValue("@Username", Username)
                cmd.Parameters.AddWithValue("@Classification", Classification)
                cmd.Parameters.AddWithValue("@Bldg", Bldg)
                cmd.Parameters.AddWithValue("@Crew", Crew)
                cmd.Parameters.AddWithValue("@PlantDate", PlantDate)
                cmd.Parameters.AddWithValue("@Phone", Phone)
                cmd.Parameters.AddWithValue("@Status", Status)
                cmd.Parameters.AddWithValue("@DateChanged", DateChanged)
                cmd.Connection = sqlCon
                sqlCon.Open()
                cmd.ExecuteNonQuery()
                sqlCon.Close()

            End Using

        End Using
        Response.Redirect("Default.aspx")
        Me.BindGrid()

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGrid()

        End If
    End Sub
    Private Sub BindGrid()
        Dim SelectBldg As String = Request.QueryString("Bldg")
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status FROM t_Employee_OT Where Bldg ='" & SelectBldg & "'")
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
