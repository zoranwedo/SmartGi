<System.ComponentModel.DefaultBindingProperty("DateValue")> _
Partial Class App_UserControls_InputDateControl
    Inherits System.Web.UI.UserControl

    Private _Mandatory As Boolean = False
    Public Property Mandatory() As Boolean
        Get
            Return _Mandatory
        End Get
        Set(ByVal value As Boolean)
            _Mandatory = value
            req_txtDate.Enabled = value
        End Set
    End Property

    Private _DefaultNow As Boolean = True
    Public Property DefaultNow() As Boolean
        Get
            Return _DefaultNow
        End Get
        Set(ByVal value As Boolean)
            _DefaultNow = value
        End Set
    End Property

    Private _ReadOnly As Boolean = False
    Public Property [ReadOnly]() As Boolean
        Get
            Return _ReadOnly
        End Get
        Set(ByVal value As Boolean)
            _ReadOnly = value
            txtDate.ReadOnly = _ReadOnly
            calendar_txtDate.Enabled = Not _ReadOnly
        End Set
    End Property


    <System.ComponentModel.Bindable(True)> _
    Public Property DateValue() As Date?
        Get
            If String.IsNullOrEmpty(txtDate.Text) Then
                Return Nothing
            Else
                Return txtDate.Text
            End If
        End Get
        Set(ByVal value As Date?)
            If value.HasValue Then
                txtDate.Text = value.Value
            Else
                txtDate.Text = String.Empty
            End If
        End Set
    End Property

    Public Property TextValue() As String
        Get
            Return txtDate.Text
        End Get
        Set(ByVal value As String)
            txtDate.Text = value
        End Set
    End Property

    Public ReadOnly Property HasValue() As Boolean
        Get
            Return Not String.IsNullOrEmpty(txtDate.Text)
        End Get
    End Property

    'ClearControl
    Public Sub ClearControl()
        txtDate.Text = IIf(_DefaultNow, Now.ToShortDateString, String.Empty)
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        req_txtDate.Enabled = _Mandatory
    End Sub

    Protected Sub txtDate_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDate.Init
        txtDate.Text = IIf(_DefaultNow, Now.ToShortDateString, String.Empty)
    End Sub
End Class
