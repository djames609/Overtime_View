Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class OTDetailsList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Me.Page.PreviousPage IsNot Nothing Then
            Dim rowIndex As Integer = Integer.Parse(Request.QueryString("RowIndex"))
            Dim GridView1 As GridView = DirectCast(Me.Page.PreviousPage.FindControl("GridView1"), GridView)
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            TxtID.Text = row.Cells(1).Text
            txtName.Text = row.Cells(2).Text
            txtUsername.Text = row.Cells(3).Text
            TxtBldg.Text = row.Cells(4).Text
            TxtCrew.Text = row.Cells(5).Text
            txtPlantDate.Text = row.Cells(6).Text
            TxtDateEntered.Text = row.Cells(7).Text
            ddOTType.Text = row.Cells(8).Text
            ddAskType.Text = row.Cells(9).Text
            TxtChargedHours.Text = row.Cells(10).Text
            txtWorkedHours.Text = row.Cells(11).Text
            TxtComments.Text = row.Cells(12).Text.Replace("&nbsp;", "")

        End If
    End Sub



    Protected Sub BtnUpdate_Click(sender As Object, e As System.EventArgs) Handles BtnUpdate.Click

        Dim Id As Integer = Convert.ToInt32(TxtID.Text)
        Dim name As String = txtName.Text
        Dim Username As String = txtUsername.Text
        Dim Bldg As String = TxtBldg.Text
        Dim Crew As String = TxtCrew.Text
        Dim PlantDate As String = txtPlantDate.Text
        Dim DateEntered As String = TxtDateEntered.Text
        Dim OvertimeType As String = Request.Form("ddOTType".ToString())
        Dim AskType As String = Request.Form("ddAskType".ToString())
        Dim ChargedHours As String = TxtChargedHours.Text
        Dim WorkedHours As String = txtWorkedHours.Text

        Dim Comments As String = TxtComments.Text.Replace("&nbsp;", "")

        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("UPDATE t_Hours_Overtime SET Name = @Name, Username = @Username, Bldg = @Bldg, Crew= @Crew, PlantDate = @PlantDate, DateEntered = @DateEntered, OvertimeType = @OvertimeType, AskType = @AskType, ChargedHours = @ChargedHours, WorkedHours = @WorkedHours, Comments = @Comments WHERE ID = @ID")
                cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Username", Username)
                cmd.Parameters.AddWithValue("@Bldg", Bldg)
                cmd.Parameters.AddWithValue("@Crew", Crew)
                cmd.Parameters.AddWithValue("@PlantDate", PlantDate)
                cmd.Parameters.AddWithValue("@DateEntered", DateEntered)
                cmd.Parameters.AddWithValue("@OvertimeType", OvertimeType)
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
        Response.Redirect("OTInfoList.aspx")
    End Sub




End Class
