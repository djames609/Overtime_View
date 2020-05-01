Imports System.Data
Imports System.Data.SqlClient

Partial Class DisplayCrewInfo
    Inherits System.Web.UI.Page
    
   
   
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            Me.BindGridJ()
            Me.BindGridK()
            Me.BindGridL()
            Me.BindGridM()
        End If
    End Sub
    
    Private Sub BindGridJ()
        Dim SelectBldg As String = Request.QueryString("Bldg")
        Dim Crew As String = "J"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
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
    Private Sub BindGridK()
        Dim SelectBldg As String = Request.QueryString("Bldg")
        Dim Crew As String = "K"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView2.DataSource = dt
                        GridView2.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView2.FooterRow.Cells(1).Text = "Crew K Count"
                        GridView2.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridL()
        Dim SelectBldg As String = Request.QueryString("Bldg")
        Dim Crew As String = "L"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView3.DataSource = dt
                        GridView3.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
                        GridView3.FooterRow.Cells(1).Text = "Crew L Count"
                        GridView3.FooterRow.Cells(2).Text = RowCount.ToString
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Private Sub BindGridM()
        Dim SelectBldg As String = Request.QueryString("Bldg")
        Dim Crew As String = "M"
        Dim constr As String = ConfigurationManager.ConnectionStrings("CG_ITConnectionString").ConnectionString
        Using con As New SqlConnection(constr)

            Using cmd As New SqlCommand("SELECT ID,  Name,Username, Classification, Bldg,Crew, PlantDate, Phone, Status FROM t_Employee_OT Where  Bldg ='" & SelectBldg & "' and crew = '" & Crew & "'")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView4.DataSource = dt
                        GridView4.DataBind()
                        Dim RowCount As Integer
                        RowCount = GridView1.Rows.Count()
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
