Imports  TourOperTableAdapters
<System.ComponentModel.DataObject()> _
Public Class TourOperBLL
    Private _toAdapter As TourOpTableAdapter = Nothing
    Protected ReadOnly Property TourOperAdapter() As TourOpTableAdapter
        Get
            If _toAdapter Is Nothing Then
                _toAdapter = New TourOpTableAdapter()
            End If

            Return _toAdapter
        End Get
    End Property
#Region "TO"
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
       Public Function GetUsersTO(ByVal MarketID As String, ByVal PayCondID As String, ByVal TourOp As String, ByVal active As Boolean) As TourOper.TourOpDataTable
        Dim usrnm As String = Membership.GetUser.UserName
        Dim tour As String = Nothing
        Dim act As Nullable(Of Boolean)

        If active Then
            act = True
        End If

        If Not String.IsNullOrEmpty(TourOp) Then
            tour = "%" & TourOp & "%"
        End If

        Return TourOperAdapter.GetDataForSearch(usrnm, MarketID, PayCondID, tour, act)

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
       Public Function GetUsersTOAll() As TourOper.TourOpDataTable
        Dim usrnm As String = Membership.GetUser.UserName

        Return TourOperAdapter.GetDataByUser(usrnm)

    End Function
#End Region

End Class

