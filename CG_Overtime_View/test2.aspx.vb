Imports System.Data
Imports System.Linq
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class test2
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Sub BindGrid()
     
        GridView1.DataBind()
    End Sub
    Protected Sub Person_Selected(sender As Object, e As EventArgs)
        Me.BindGrid()
    End Sub
End Class
