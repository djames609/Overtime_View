Imports System.Data
Imports System.Linq
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class PrintAskListWD
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGridWork()
            Me.BindGridSen()
            Me.BindGridCharge()
        End If
    End Sub
    Private Sub BindGridWork()
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim SelectCrew As String = Request.QueryString("Crews")

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand((Convert.ToString("SELECT tho.Name, tho.Crew,Convert(varchar, tho.PlantDate, 101) as PlantDate, coalesce(vwcmf.TotalChargedHours,0) as TotalChargedHours,  coalesce(vwcmf.TotalWorkHours,0) as TotalWorkHours,coalesce(vwcmf.TotalMandatoryRefuseCountWD,0) as TotalMandatoryRefuseCountWD,coalesce(vwcmf.TotalMandatoryRefuseCountWE,0) as TotalMandatoryRefuseCountWE,vwd.ThisWeek,vwd.NextWeek,vwd.WillDrop2Wks,vwd.WillDrop3Wks FROM dbo.t_Hours_Overtime AS tho LEFT OUTER JOIN dbo.v_worked_charged_mandatory_final AS vwcmf ON tho.Username = vwcmf.Person_ID inner join t_employee_OT teo on tho.Username = teo.username Left Outer Join dbo.v_worked_dropped as vwd  on tho.Username = vwd.Person_ID GROUP BY tho.Name, vwcmf.TotalWorkHours, vwcmf.TotalMandatoryRefuseCountWE, vwcmf.TotalMandatoryRefuseCountWD, vwcmf.TotalChargedHours, tho.Crew,tho.Plantdate, tho.Username, teo.Status, vwd.ThisWeek, vwd.NextWeek, vwd.WillDrop2Wks, vwd.WillDrop3Wks Having         tho.Crew = (") & SelectCrew) + ") and teo.Status = 'Active' Order By totalworkhours, Plantdate ")
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
    Private Sub BindGridSen()
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim SelectCrew As String = Request.QueryString("Crews")

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand((Convert.ToString("SELECT tho.Name, tho.Crew,Convert(varchar, tho.PlantDate, 101) as PlantDate, coalesce(vwcmf.TotalChargedHours,0) as TotalChargedHours,  coalesce(vwcmf.TotalWorkHours,0) as TotalWorkHours,coalesce(vwcmf.TotalMandatoryRefuseCountWD,0) as TotalMandatoryRefuseCountWD,coalesce(vwcmf.TotalMandatoryRefuseCountWE,0) as TotalMandatoryRefuseCountWE,vwd.ThisWeek,vwd.NextWeek,vwd.WillDrop2Wks,vwd.WillDrop3Wks FROM dbo.t_Hours_Overtime AS tho LEFT OUTER JOIN dbo.v_worked_charged_mandatory_final AS vwcmf ON tho.Username = vwcmf.Person_ID inner join t_employee_OT teo on tho.Username = teo.username Left Outer Join dbo.v_worked_dropped as vwd  on tho.Username = vwd.Person_ID GROUP BY tho.Name, vwcmf.TotalWorkHours, vwcmf.TotalMandatoryRefuseCountWE, vwcmf.TotalMandatoryRefuseCountWD, vwcmf.TotalChargedHours, tho.Crew,tho.Plantdate, tho.Username, teo.Status, vwd.ThisWeek, vwd.NextWeek, vwd.WillDrop2Wks, vwd.WillDrop3Wks Having         tho.Crew = (") & SelectCrew) + ") and teo.Status = 'Active' Order By  tho.PlantDate,totalworkhours ")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()

                        sda.Fill(dt)

                        GridView2.DataSource = dt
                        GridView2.DataBind()


                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridCharge()
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Dim SelectCrew As String = Request.QueryString("Crews")

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand((Convert.ToString("SELECT tho.Name, tho.Crew,Convert(varchar, tho.PlantDate, 101) as PlantDate, coalesce(vwcmf.TotalChargedHours,0) as TotalChargedHours,  coalesce(vwcmf.TotalWorkHours,0) as TotalWorkHours,coalesce(vwcmf.TotalMandatoryRefuseCountWD,0) as TotalMandatoryRefuseCountWD,coalesce(vwcmf.TotalMandatoryRefuseCountWE,0) as TotalMandatoryRefuseCountWE,vwd.ThisWeek,vwd.NextWeek,vwd.WillDrop2Wks,vwd.WillDrop3Wks FROM dbo.t_Hours_Overtime AS tho LEFT OUTER JOIN dbo.v_worked_charged_mandatory_final AS vwcmf ON tho.Username = vwcmf.Person_ID inner join t_employee_OT teo on tho.Username = teo.username Left Outer Join dbo.v_worked_dropped as vwd  on tho.Username = vwd.Person_ID GROUP BY tho.Name, vwcmf.TotalWorkHours, vwcmf.TotalMandatoryRefuseCountWE, vwcmf.TotalMandatoryRefuseCountWD, vwcmf.TotalChargedHours, tho.Crew,tho.Plantdate, tho.Username, teo.Status, vwd.ThisWeek, vwd.NextWeek, vwd.WillDrop2Wks, vwd.WillDrop3Wks Having         tho.Crew = (") & SelectCrew) + ") and teo.Status = 'Active'Order By totalChargedhours, tho.Plantdate ")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()

                        sda.Fill(dt)

                        GridView3.DataSource = dt
                        GridView3.DataBind()


                    End Using
                End Using
            End Using
        End Using
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class

