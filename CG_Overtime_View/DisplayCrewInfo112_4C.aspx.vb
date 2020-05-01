Imports System.Data
Imports System.Data.SqlClient

Partial Class DisplayCrewInfo112_4C
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGridA()
            Me.BindGridB()
            Me.BindGridC()
            Me.BindGridD()
            Me.BindGridE()
        End If
    End Sub

    Private Sub BindGridA()
        Dim SelectBldg As String = "Building 112"
        Dim Crew As String = "B112-4A"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView1.FooterRow.Cells(1).Text = "B112-4A Count"
                        GridView1.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridB()
        Dim SelectBldg As String = "Building 112"
        Dim Crew As String = "B112-4B"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and  crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView2.DataSource = dt
                        GridView2.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView2.Rows.Count()
                        GridView2.FooterRow.Cells(1).Text = "B112-4B Crew"
                        GridView2.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridC()
        Dim SelectBldg As String = "Building 112"
        Dim Crew As String = "B112-4C"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView3.DataSource = dt
                        GridView3.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView3.Rows.Count()
                        GridView3.FooterRow.Cells(1).Text = "B112-4C Crew"
                        GridView3.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridD()
        Dim SelectBldg As String = "Building 112"
        Dim Crew As String = "B112-4D"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView4.DataSource = dt
                        GridView4.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView4.Rows.Count()
                        GridView4.FooterRow.Cells(1).Text = "B112-4D Crew"
                        GridView4.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridE()
        Dim SelectBldg As String = "Building 112"
        Dim Crew As String = "B112-Crew 1_Screener"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew in ('B112-Crew 1_Screener','B112-Crew 2_Screener','B112-Midnight_Screener','B112-S/R')")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView5.DataSource = dt
                        GridView5.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView5.Rows.Count()
                        GridView5.FooterRow.Cells(1).Text = "B112 Screeners"
                        GridView5.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
