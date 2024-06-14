<System.ComponentModel.DefaultBindingProperty("SelectedHotel")> _
Partial Class App_UserControls_HotelExpanderControl
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

    Private _CollapsedDefault As Boolean = True
    Public Property CollapsedDefailt() As Boolean
        Get
            Return _CollapsedDefault
        End Get
        Set(ByVal value As Boolean)
            _CollapsedDefault = value
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
        exMore.Collapsed = _CollapsedDefault
    End Sub

    Public Sub SetHotel(ByVal value As Integer)
        exHotelGroup.SelectedValue = String.Empty
        exHotel.SelectedValue = value
    End Sub

    Public Sub CookieLoad(ByVal cookie As HttpCookie)
        If cookie(Me.ID & "exMore") IsNot Nothing Then exMore.Collapsed = cookie(Me.ID & "exMore")
        If cookie(Me.ID & "exHotelGroup") IsNot Nothing Then exHotelGroup.SelectedValue = cookie(Me.ID & "exHotelGroup")
        If cookie(Me.ID & "exHotel") IsNot Nothing Then exHotel.SelectedValue = cookie(Me.ID & "exHotel")
    End Sub

    Public Sub CookieSave(ByVal cookie As HttpCookie)
        cookie(Me.ID & "exMore") = exMore.Collapsed.ToString
        cookie(Me.ID & "exHotelGroup") = exHotelGroup.SelectedValue
        cookie(Me.ID & "exHotel") = exHotel.SelectedValue
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BulidContextKey()

        'Dim c As ClientScriptManager = Me.Page.ClientScript
        'If Not c.IsStartupScriptRegistered(Me.GetType(), "hghc_Startup") Then
        '    Dim scriptString As String = _
        '        "<script type='text/javascript'> " & vbNewLine & _
        '        "document.getElementById('td_hghc_GroupLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
        '        "document.getElementById('td_hghc_HotelLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
        '        "</script>"
        '    c.RegisterStartupScript(Me.GetType(), "hghc_Startup", scriptString)
        'End If
    End Sub

    Protected Sub exMore_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles exMore.Init
        exMore.Collapsed = _CollapsedDefault
    End Sub

    'ContextKey
    Private Sub BulidContextKey()
        Dim ck As String = "NoCCI:" & _NoCCI.ToString() & ";Mandatory:" & _Mandatory.ToString() & ";"
        exHotelGroup.ContextKey = ck
        exHotel.ContextKey = ck
    End Sub

End Class
