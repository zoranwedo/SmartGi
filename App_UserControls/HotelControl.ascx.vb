<System.ComponentModel.DefaultBindingProperty("SelectedHotel")> _
Partial Class App_UserControls_HotelControl
    Inherits System.Web.UI.UserControl

    Public Property Enabled() As Boolean
        Get
            Return ddlHotel.Enabled
        End Get
        Set(ByVal value As Boolean)
            ddlHotel.Enabled = value
        End Set
    End Property

    Private _LabelWidth As Unit
    Public Property LabelWidth() As Unit
        Get
            Return _LabelWidth
        End Get
        Set(ByVal value As Unit)
            _LabelWidth = value
            'lblHotel.Width = New Unit(value.Value - 30)
        End Set
    End Property

    Private _LabelCssClass As String
    Public Property LabelCssClass() As String
        Get
            Return _LabelCssClass
        End Get
        Set(ByVal value As String)
            _LabelCssClass = value
        End Set
    End Property

    Private _ControlWidth As Unit
    Public Property ControlWidth() As Unit
        Get
            Return _ControlWidth
        End Get
        Set(ByVal value As Unit)
            _ControlWidth = value
        End Set
    End Property

    Private _NoCCI As Boolean = False
    Public Property NoCCI() As Boolean
        Get
            Return exHotel.ContextKey
        End Get
        Set(ByVal value As Boolean)
            _NoCCI = value
            BulidContextKey()
        End Set
    End Property

    Private _Mandatory As Boolean = False
    Public Property Mandatory() As Boolean
        Get
            Return _Mandatory
        End Get
        Set(ByVal value As Boolean)
            _Mandatory = value
            BulidContextKey()
        End Set
    End Property

    Public Property HotelLabel() As String
        Get
            Return lblHotel.Text
        End Get
        Set(ByVal value As String)
            lblHotel.Text = value
        End Set
    End Property

    'Hotel
    Public Property SelectedHotelIndex() As Integer
        Get
            Return ddlHotel.SelectedIndex
        End Get
        Set(ByVal value As Integer)
            ddlHotel.SelectedIndex = value
        End Set
    End Property

    Public Property SelectedHotelValue() As String
        Get
            Return ddlHotel.SelectedValue
        End Get
        Set(ByVal value As String)
            ddlHotel.SelectedValue = value
        End Set
    End Property

    Public ReadOnly Property SelectedHotelItem() As ListItem
        Get
            Return ddlHotel.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedHotel() As String
        Get
            If ddlHotel.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlHotel.SelectedValue
            End If
        End Get
    End Property

    'SelectionLevel
    Public Function SelectionLevel() As Integer
        Dim r As Integer = 0
        If ddlHotel.SelectedValue <> "0" Then r += 8
        Return r
    End Function

    'ClearControl
    Public Sub ClearControl()
        exHotel.SelectedValue = String.Empty
    End Sub

    'Cookies
    Public Sub SaveCookie(ByVal cName As String)
        Response.Cookies(cName)(Me.ID & "exHotel") = exHotel.SelectedValue
    End Sub

    Public Sub LoadCookie(ByVal cName As String)
        If (Request.Cookies(cName)(Me.ID & "exHotel") IsNot Nothing) Then _
            exHotel.SelectedValue = Request.Cookies(cName)(Me.ID & "exHotel")
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BulidContextKey()

        Dim c As ClientScriptManager = Me.Page.ClientScript
        If Not c.IsStartupScriptRegistered(Me.GetType(), Me.ID & "_hc_Startup") Then
            Dim scriptString As String = _
                "<script type='text/javascript'>" & vbNewLine & _
                "document.getElementById('" & Me.ID & "_td_hc_HotelLabel').className='" & _LabelCssClass & "';" & vbNewLine & _
                "document.getElementById('" & Me.ID & "_td_hc_HotelLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
                "document.getElementById('" & Me.ID & "_td_hc_HotelControl').width='" & _ControlWidth.ToString() & "';" & vbNewLine & _
                "</script>"
            c.RegisterStartupScript(Me.GetType(), Me.ID & "_hc_Startup", scriptString)
        End If
    End Sub

    'ContextKey
    Private Sub BulidContextKey()
        Dim ck As String = "NoCCI:" & _NoCCI.ToString() & ";Mandatory:" & _Mandatory.ToString()
        exHotel.ContextKey = ck
    End Sub
End Class
