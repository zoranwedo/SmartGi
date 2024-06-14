<System.ComponentModel.DefaultBindingProperty("DateFrom")> _
Partial Class App_UserControls_FromToDateControl
    Inherits System.Web.UI.UserControl

    Private _MandatoryFrom As Boolean = False
    Public Property MandatoryFrom() As Boolean
        Get
            Return _MandatoryFrom
        End Get
        Set(ByVal value As Boolean)
            _MandatoryFrom = value
            req_txtFrom.Enabled = value
        End Set
    End Property

    Private _MandatoryTo As Boolean = False
    Public Property MandatoryTo() As Boolean
        Get
            Return _MandatoryTo
        End Get
        Set(ByVal value As Boolean)
            _MandatoryTo = value
            req_txtTo.Enabled = value
        End Set
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public Property DateFrom() As String
        Get
            Return txtFrom.Text
        End Get
        Set(ByVal value As String)
            txtFrom.Text = value
        End Set
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public Property DateTo() As String
        Get
            Return txtTo.Text
        End Get
        Set(ByVal value As String)
            txtTo.Text = value
        End Set
    End Property

    Public ReadOnly Property HasFromValue() As Boolean
        Get
            Return Not String.IsNullOrEmpty(txtFrom.Text)
        End Get
    End Property


    Public ReadOnly Property HasToValue() As Boolean
        Get
            Return Not String.IsNullOrEmpty(txtTo.Text)
        End Get
    End Property

    'RangeString
    Public ReadOnly Property RangeString() As String
        Get
            Dim chFrom As String = txtFrom.Text
            Dim chTo As String = txtTo.Text
            Dim b As Integer = 0
            Dim r As String
            If Not String.IsNullOrEmpty(chFrom) Then b = b + 1
            If Not String.IsNullOrEmpty(chTo) Then b = b + 10

            Select Case b
                Case 1 : r = String.Format("from {0}", chFrom)
                Case 10 : r = String.Format("to {0}", chTo)
                Case 11 : r = String.Format("{0} - {1}", chFrom, chTo)
                Case Else : r = String.Empty
            End Select

            Return r
        End Get
    End Property

    'Duration
    Public Function Duration(ByVal GreaterThan As Integer, ByVal t As DateInterval) As Boolean
        Dim r As Boolean = String.IsNullOrEmpty(txtFrom.Text) Or String.IsNullOrEmpty(txtTo.Text)
        If Not r Then r = DateDiff(t, Date.Parse(txtFrom.Text), Date.Parse(txtTo.Text)) > GreaterThan
        Return r
    End Function

    'ClearControl
    Public Sub ClearControl()
        txtFrom.Text = String.Empty
        txtTo.Text = String.Empty
    End Sub

    Public Sub SetDate(ByVal value As DateTime)
        txtFrom.Text = value.ToShortDateString()
        txtTo.Text = value.ToShortDateString()
    End Sub

    'Cookies
    Public Sub SaveCookie(ByVal cName As String)
        Response.Cookies(cName)(Me.ID & "txtFrom") = txtFrom.Text
        Response.Cookies(cName)(Me.ID & "txtTo") = txtTo.Text
    End Sub

    Public Sub LoadCookie(ByVal cName As String)
        If (Request.Cookies(cName)(Me.ID & "txtFrom") IsNot Nothing) Then _
            txtFrom.Text = Request.Cookies(cName)(Me.ID & "txtFrom")
        If (Request.Cookies(cName)(Me.ID & "txtTo") IsNot Nothing) Then _
            txtTo.Text = Request.Cookies(cName)(Me.ID & "txtTo")
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        req_txtFrom.Enabled = _MandatoryFrom
        req_txtTo.Enabled = _MandatoryTo
    End Sub

End Class
