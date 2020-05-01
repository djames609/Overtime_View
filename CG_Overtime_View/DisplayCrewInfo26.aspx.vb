Imports System.Data
Imports System.Data.SqlClient

Partial Class DisplayCrewInfo26
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGrid()
           
        End If
    End Sub

    Private Sub BindGrid()
        Dim SelectBldg As String = "Building 26"
        Dim Crew As String = "Warehouse_111340"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew  in ('Warehouse_111340','Warehouse_Tank Farm','Warehouse_Utilty','Warehouse_FG Oder Filler')")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView1.FooterRow.Cells(1).Text = "Crew Warehouse_111340 Count"
                        GridView1.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridTank()
        Dim SelectBldg As String = "Building 26"
        Dim Crew As String = "Warehouse_Tank Farm"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate,  Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView2.DataSource = dt
                        GridView2.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView2.FooterRow.Cells(1).Text = "Crew Warehouse_Tank Farm Count"
                        GridView2.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridUtility()
        Dim SelectBldg As String = "Building 26"
        Dim Crew As String = "Warehouse_Utilty"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView3.DataSource = dt
                        GridView3.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView3.FooterRow.Cells(1).Text = "Crew Warehouse_Utilty Count"
                        GridView3.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridOrder()
        Dim SelectBldg As String = "Building 26"
        Dim Crew As String = "Warehouse_FG Oder Filler"
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
                        RowCount = GridView1.Rows.Count()
                        GridView4.FooterRow.Cells(1).Text = "Crew Warehouse_FG Oder Filler Count"
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
