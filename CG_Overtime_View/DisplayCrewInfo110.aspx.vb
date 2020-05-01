Imports System.Data
Imports System.Data.SqlClient

Partial Class DisplayCrewInfo110
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGrid110()

            Me.BindGridMM4()
            Me.BindGridForm()

        End If
    End Sub

    Private Sub BindGrid110()
        Dim SelectBldg As String = "Building 110"
        Dim Crew As String = "110"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "' order by Crew, PlantDate")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView1.FooterRow.Cells(1).Text = "Warehouse Count"
                        GridView1.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
   
    Private Sub BindGridMM4()
        Dim SelectBldg As String = "Building 110"
        Dim Crew As String = "B110-D_3229"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew in ('B110-A_3229','B110-B_3229','B110-C_3229','B110-D_3229') order by Crew, PlantDate")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView3.DataSource = dt
                        GridView3.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView3.Rows.Count()
                        GridView3.FooterRow.Cells(1).Text = "Melt/Mill 4 Crew"
                        GridView3.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridForm()
        Dim SelectBldg As String = "Building 110"
        Dim Crew As String = "B110-A_3234"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew in ('B110-A_3234','B110-B_3234','B110-C_3234','B110-D_3234') order by Crew, PlantDate")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView4.DataSource = dt
                        GridView4.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView4.Rows.Count()
                        GridView4.FooterRow.Cells(1).Text = "Formers Count"
                        GridView4.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
