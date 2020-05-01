Imports System.Data
Imports System.Linq
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class cutoffdisplay
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()


        End If
    End Sub
    Private Sub BindGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim SelectCrew As String = Request.QueryString("Crews")
        Dim Selectcutoff As String = Request.QueryString("cutoff")
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand((Convert.ToString("SELECT   tho.Name, tho.Crew, convert(varchar,tho.PlantDate,101) as PlantDate, Max(Convert(varchar,tho.DateEntered,101)) as DateEntered, sum(tho.ChargedHours) as ChargedHours,vwcmf.TotalWorkHours, '____|____' as Day1, '____|____' as Day2, '____|____' as Day3, '____|____' as Day4, '____|____' as Day5, '____|____' as Day6, '____|____' as Day7  FROM t_Hours_Overtime tho inner join t_employee_ot teo on tho.Username = teo.Username Left Outer join v_worked_charged_mandatory_final vwcmf on teo.Username = vwcmf.Person_ID Where teo.Status = 'Active' and tho.Crew in (") & SelectCrew) + ") and tho.DateEntered <= '" + Selectcutoff + "' GROUP BY tho.Name, tho.Crew, tho.PlantDate, vwcmf.TotalWorkHours ORDER BY sum(tho.ChargedHours),CONVERT(date, tho.PlantDate, 102)")

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

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
