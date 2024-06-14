
Partial Class Maintenance_Hotel_imgShow
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Using proc As New dsMaintHotelTableAdapters.HotelTableAdapter
            Dim hid As String = Request.QueryString.Get("HotelID")
            Dim tab As dsMaintHotel.HotelDataTable = proc.GetDataByHotelID(Integer.Parse(hid))
            Dim row As dsMaintHotel.HotelRow = tab.Rows(0)
            Try
                If Not (String.IsNullOrEmpty(row.Logo.Length.ToString)) Then
                    Response.BinaryWrite(row.Logo)
                End If
            Catch ex As Exception
                Response.Redirect(Page.Request.UrlReferrer.ToString)
                Exit Sub
            End Try
        End Using
    End Sub

End Class
