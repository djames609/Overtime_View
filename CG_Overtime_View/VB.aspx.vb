Imports System.Data
Imports System.Linq
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Sub BindGrid()
        Dim SelectCrew As String = Request.QueryString("Crews")
        Dim cmd As New SqlCommand((Convert.ToString("SELECT   Id, name,username, DateEntered, OvertimeType, AskType, ChargedHours, WorkedHours, Comments, Bldg, Crew, PlantDate  FROM t_Hours_Overtime Where Crew in (") & SelectCrew) + ")Order by Crew")
        gvCustomers.DataSource = Me.ExecuteQuery(cmd, "SELECT")
        gvCustomers.DataBind()
    End Sub
    Private Function ExecuteQuery(cmd As SqlCommand, action As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(conString)
            cmd.Connection = con
            Select Case action
                Case "SELECT"
                    Using sda As New SqlDataAdapter()
                        sda.SelectCommand = cmd
                        Using dt As New DataTable()
                            sda.Fill(dt)
                            Return dt
                        End Using
                    End Using
                Case "UPDATE"
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                    Exit Select
            End Select
            Return Nothing
        End Using
    End Function

    Protected Sub Update(sender As Object, e As EventArgs)
        For Each row As GridViewRow In gvCustomers.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim isChecked As Boolean = row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked
                If isChecked Then
                    Dim cmd As New SqlCommand("UPDATE t_hours_Overtime SET Name = @Name, Username = @Username, DateEntered = @DateEntered, OvertimeType = @OvertimeType, AskType = @AskType, ChargedHours = @ChargedHours, WorkedHours = @WorkedHours WHERE Id = @Id")
                    cmd.Parameters.AddWithValue("@Name", row.Cells(1).Controls.OfType(Of TextBox)().FirstOrDefault().Text)
                    cmd.Parameters.AddWithValue("@username", row.Cells(2).Controls.OfType(Of TextBox)().FirstOrDefault().Text)
                    cmd.Parameters.AddWithValue("@DateEntered", row.Cells(3).Controls.OfType(Of TextBox)().FirstOrDefault().Text)
                    cmd.Parameters.AddWithValue("@OvertimeType", row.Cells(4).Controls.OfType(Of DropDownList)().FirstOrDefault().SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@AskType", row.Cells(5).Controls.OfType(Of DropDownList)().FirstOrDefault().SelectedItem.Value)
                    cmd.Parameters.AddWithValue("@ChargedHours", row.Cells(6).Controls.OfType(Of TextBox)().FirstOrDefault().Text)
                    cmd.Parameters.AddWithValue("@WorkedHours", row.Cells(7).Controls.OfType(Of TextBox)().FirstOrDefault().Text)
                    cmd.Parameters.AddWithValue("@Id", gvCustomers.DataKeys(row.RowIndex).Value)
                    Me.ExecuteQuery(cmd, "SELECT")
                End If
            End If
        Next
        btnUpdate.Visible = False
        Me.BindGrid()
    End Sub
   
    Protected Sub OnCheckedChanged(sender As Object, e As EventArgs)
        Dim isUpdateVisible As Boolean = False
        Dim chk As CheckBox = TryCast(sender, CheckBox)
        If chk.ID = "chkAll" Then
            For Each row As GridViewRow In gvCustomers.Rows
                If row.RowType = DataControlRowType.DataRow Then
                    row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked = chk.Checked
                End If
            Next
        End If
        Dim chkAll As CheckBox = TryCast(gvCustomers.HeaderRow.FindControl("chkAll"), CheckBox)
        chkAll.Checked = True
        For Each row As GridViewRow In gvCustomers.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim isChecked As Boolean = row.Cells(0).Controls.OfType(Of CheckBox)().FirstOrDefault().Checked
                For i As Integer = 1 To row.Cells.Count - 1
                    row.Cells(i).Controls.OfType(Of Label)().FirstOrDefault().Visible = Not isChecked
                    If row.Cells(i).Controls.OfType(Of TextBox)().ToList().Count > 0 Then
                        row.Cells(i).Controls.OfType(Of TextBox)().FirstOrDefault().Visible = isChecked
                    End If
                    If row.Cells(i).Controls.OfType(Of DropDownList)().ToList().Count > 0 Then
                        row.Cells(i).Controls.OfType(Of DropDownList)().FirstOrDefault().Visible = isChecked
                    End If
                    If isChecked AndAlso Not isUpdateVisible Then
                        isUpdateVisible = True
                    End If
                    If Not isChecked Then
                        chkAll.Checked = False
                    End If
                Next
            End If
        Next
        btnUpdate.Visible = isUpdateVisible
    End Sub

End Class
