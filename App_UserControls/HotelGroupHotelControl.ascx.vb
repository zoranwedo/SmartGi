<System.ComponentModel.DefaultBindingProperty("SelectedHotel")> _
Partial Class App_UserControls_HotelGroupHotelControl
    Inherits System.Web.UI.UserControl

    Private _LabelWidth As Unit
    Public Property LabelWidth() As Unit
        Get
            Return _LabelWidth
        End Get
        Set(ByVal value As Unit)
            _LabelWidth = value
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

    'HotelGroup
    Public Property SelectedHotelGroupIndex() As Integer
        Get
            Return ddlHotelGroup.SelectedIndex
        End Get
        Set(ByVal value As Integer)
            ddlHotelGroup.SelectedIndex = value
        End Set
    End Property

    Public Property SelectedHotelGroupValue() As String
        Get
            Return ddlHotelGroup.SelectedValue
        End Get
        Set(ByVal value As String)
            ddlHotelGroup.SelectedValue = value
        End Set
    End Property

    Public ReadOnly Property SelectedHotelGroupItem() As ListItem
        Get
            Return ddlHotelGroup.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedHotelGroup() As String
        Get
            If ddlHotelGroup.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlHotelGroup.SelectedValue
            End If
        End Get
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
        If ddlHotelGroup.SelectedValue <> "0" Then r += 4
        If ddlHotel.SelectedValue <> "0" Then r += 8
        Return r
    End Function

    'ClearControl
    Public Sub ClearControl()
        exHotelGroup.SelectedValue = String.Empty
        exHotel.SelectedValue = String.Empty
    End Sub

    'Cookies
    Public Sub SaveCookie(ByVal cName As String)
        Response.Cookies(cName)(Me.ID & "exHotelGroup") = exHotelGroup.SelectedValue
        Response.Cookies(cName)(Me.ID & "exHotel") = exHotel.SelectedValue
    End Sub

    Public Sub LoadCookie(ByVal cName As String)
        If (Request.Cookies(cName)(Me.ID & "exHotelGroup") IsNot Nothing) Then _
            exHotelGroup.SelectedValue = Request.Cookies(cName)(Me.ID & "exHotelGroup")
        If (Request.Cookies(cName)(Me.ID & "exHotel") IsNot Nothing) Then _
            exHotel.SelectedValue = Request.Cookies(cName)(Me.ID & "exHotel")
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BulidContextKey()

        Dim c As ClientScriptManager = Me.Page.ClientScript
        If Not c.IsStartupScriptRegistered(Me.GetType(), "hghc_Startup") Then
            Dim scriptString As String = _
                "<script type='text/javascript'> " & vbNewLine & _
                "document.getElementById('td_hghc_GroupLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
                "document.getElementById('td_hghc_GroupControl').width='" & _ControlWidth.ToString() & "';" & vbNewLine & _
                "document.getElementById('td_hghc_HotelLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
                "document.getElementById('td_hghc_HotelControl').width='" & _ControlWidth.ToString() & "';" & vbNewLine & _
                "</script>"
            c.RegisterStartupScript(Me.GetType(), "hghc_Startup", scriptString)
        End If
    End Sub

    'ContextKey
    Private Sub BulidContextKey()
        Dim ck As String = "NoCCI:" & _NoCCI.ToString() & ";"
        exHotelGroup.ContextKey = ck
        exHotel.ContextKey = ck
    End Sub

End Class
