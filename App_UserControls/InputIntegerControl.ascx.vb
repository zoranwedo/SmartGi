<System.ComponentModel.DefaultBindingProperty("IntegerValue")> _
Partial Class App_UserControls_InputIntegerControl
    Inherits System.Web.UI.UserControl

    Private _Mandatory As Boolean = False
    Public Property Mandatory() As Boolean
        Get
            Return _Mandatory
        End Get
        Set(ByVal value As Boolean)
            _Mandatory = value
            req_txtInteger.Enabled = value
        End Set
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public Property IntegerValue() As Integer
        Get
            Return txtInteger.Text
        End Get
        Set(ByVal value As Integer)
            txtInteger.Text = value
        End Set
    End Property

    Public ReadOnly Property TextValue() As String
        Get
            Return txtInteger.Text
        End Get
    End Property

    Public ReadOnly Property HasValue() As Boolean
        Get
            Return Not String.IsNullOrEmpty(txtInteger.Text)
        End Get
    End Property

    'ClearControl
    Public Sub ClearControl()
        txtInteger.Text = String.Empty
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        req_txtInteger.Enabled = _Mandatory
    End Sub

End Class
