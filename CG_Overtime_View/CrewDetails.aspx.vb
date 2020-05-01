Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class CrewDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Me.Page.PreviousPage IsNot Nothing Then
            Dim rowIndex As Integer = Integer.Parse(Request.QueryString("RowIndex"))
            Dim GridView1 As GridView = DirectCast(Me.Page.PreviousPage.FindControl("GridView1"), GridView)
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            TxtID.Text = row.Cells(1).Text
            txtName.Text = row.Cells(2).Text
            txtUser.Text = row.Cells(3).Text
           
            txtClass.Text = row.Cells(4).Text
            ddBldg.Text = row.Cells(5).Text
            DdCrew.Text = row.Cells(6).Text
            txtPlantDate.Text = row.Cells(7).Text
            TxtPhone.Text = row.Cells(8).Text
            ddStatus.Text = row.Cells(9).Text

        End If
       
    End Sub



    Protected Sub BtnUpdate_Click(sender As Object, e As System.EventArgs) Handles BtnUpdate.Click

        Dim Id As Integer = Convert.ToInt32(TxtID.Text)
        Dim name As String = txtName.Text
        Dim username As String = txtUser.Text
       
        Dim classification As String = txtClass.Text
        Dim bldg As String = Request.Form("ddbldg".ToString())
        Dim crew As String = Request.Form("ddcrew".ToString())
        Dim PlantDate As String = txtPlantDate.Text
        Dim Phone As String = TxtPhone.Text

        Dim status As String = Request.Form("ddstatus".ToString())


        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("UPDATE t_Employee_OT SET Name = @Name, Username = @Username,  Classification = @Classification, Bldg = @Bldg, Crew = @Crew, PlantDate = @PlantDate, Phone = @Phone, Status = @Status WHERE ID = @ID")
                cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Username", username)

                cmd.Parameters.AddWithValue("@Classification", classification)
                cmd.Parameters.AddWithValue("@Bldg", bldg)
                cmd.Parameters.AddWithValue("@Crew", crew)
                cmd.Parameters.AddWithValue("@PlantDate", PlantDate)
                cmd.Parameters.AddWithValue("@Phone", Phone)
                cmd.Parameters.AddWithValue("@Status", status)

                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Response.Redirect("Default.aspx")
    End Sub
   
   
    

    

   
End Class
