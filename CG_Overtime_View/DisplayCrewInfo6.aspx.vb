Imports System.Data
Imports System.Data.SqlClient

Partial Class DisplayCrewInfo6
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGridQ()
            Me.BindGridR()
            Me.BindGridS()
            Me.BindGridT()
        End If
    End Sub

    Private Sub BindGridQ()
        Dim SelectBldg As String = "Building 6"
        Dim Crew As String = "B6-J"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView1.FooterRow.Cells(1).Text = "Crew J Count"
                        GridView1.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridR()
        Dim SelectBldg As String = "Building 6"
        Dim Crew As String = "B6-K"
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
                        RowCount = GridView2.Rows.Count()
                        GridView2.FooterRow.Cells(1).Text = "Crew K Count"
                        GridView2.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridS()
        Dim SelectBldg As String = "Building 6"
        Dim Crew As String = "B6-L"
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
                        GridView3.FooterRow.Cells(1).Text = "Crew L Count"
                        GridView3.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridT()
        Dim SelectBldg As String = "Building 6"
        Dim Crew As String = "B6-M"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Status, DateChanged FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView4.DataSource = dt
                        GridView4.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView4.Rows.Count()
                        GridView4.FooterRow.Cells(1).Text = "Crew M Count"
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
