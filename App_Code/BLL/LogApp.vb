Imports LogAppTableAdapters
<System.ComponentModel.DataObject()> _
Public Class LogApp
    Public Const logSource As String = "USER"

    Public Const stateComplete As String = "COMPLETED"
    Public Const stateError As String = "ERROR"
    Public Const stateStart As String = "STARTED"
    Public Const stateWarning As String = "WARNING"

    Public Const objCtr As String = "Contract"
    Public Const objSpo As String = "Special"
    Public Const objSup As String = "Supplement"
    Public Const objPro As String = "Preinvoice"
    Public Const objInv As String = "Invoice"
    Public Const objAcc As String = "AccDocument"
    Public Const objRpt As String = "Report"

    Public Const evnInset As String = "Insert"
    Public Const evnUpdate As String = "Update"
    Public Const evnDelete As String = "Delete"
    Public Const evnState As String = "State"
    Public Const evnPrint As String = "Print"
    Public Const evnRegister As String = "Registration"
    Public Const evnApply As String = "Application"

    Private _logAdapter As LogAppTableAdapters.QueriesTableAdapter = Nothing
    Protected ReadOnly Property taLog() As LogAppTableAdapters.QueriesTableAdapter
        Get
            If _logAdapter Is Nothing Then
                _logAdapter = New LogAppTableAdapters.QueriesTableAdapter
            End If

            Return _logAdapter
        End Get
    End Property

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, False)> _
    Public Sub LogUserAction(logUser As String, logObject As String, logEvent As String, logState As String, logOjectID As Integer, logText As String)
        taLog.LogAction(logSource, logUser, logObject, logEvent, logState, logOjectID, logText)
    End Sub

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, False)> _
    Public Sub LogUserAction(ByVal logUser As String, ByVal logObject As String, ByVal logEvent As String, ByVal logState As String, ByVal logText As String)
        taLog.LogAction(logSource, logUser, logObject, logEvent, logState, Nothing, logText)
    End Sub

    'Invoice sent from hotel
    'Invoice reviewed by hotel set
    'Inovice reviewed by hotel reset
    'Invoice reviewed by CCI set
    'Inovice reviewed by CCI reset
    'Invoice state changed from :0 to :0
    'Invoice created
    'Invoice updated
    'Invoice delivery date set
    '*Invoice recalculated
    '*Stay detail recalculated
    '*Bill detail rate changed
    '*Supplement bill detail added
    '*Supplement bill detail deleted
End Class
