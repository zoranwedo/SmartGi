<System.ComponentModel.DefaultBindingProperty("SelectedTourOp")> _
Partial Class App_UserControls_TourOpExpanderControl
    Inherits System.Web.UI.UserControl

    Public Enum FixKindType
        None
        FixSingle
        FixGroup
        DefaultGroup
        DefaultSingle
    End Enum

    Public Const TourOpSingle As Integer = 1
    Public Const TourOpGroup As Integer = 2

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

    Private _NoLocal As Boolean = False
    Public Property NoLocal() As Boolean
        Get
            Return _NoLocal
        End Get
        Set(ByVal value As Boolean)
            _NoLocal = value
            BulidContextKey()
        End Set
    End Property

    Private _FixKind As FixKindType = FixKindType.None
    Public Property FixKind() As FixKindType
        Get
            Return _FixKind
        End Get
        Set(ByVal value As FixKindType)
            _FixKind = value
            If _FixKind = FixKindType.None Then exTourOpKind.SelectedValue = String.Empty
        End Set
    End Property

    Private Function FixKindInt() As Integer
        Select Case _FixKind
            Case FixKindType.FixSingle : Return 1
            Case FixKindType.FixGroup : Return 2
            Case Else : Return 0
        End Select
    End Function

    Private Function GetFixKindType() As String
        Select Case _FixKind
            Case FixKindType.FixSingle
                Return TourOpSingle
            Case FixKindType.DefaultSingle
                Return TourOpSingle
            Case FixKindType.FixGroup
                Return TourOpGroup
            Case FixKindType.DefaultGroup
                Return TourOpGroup
            Case Else
                Return String.Empty
        End Select
    End Function

    'TourOpKind
    Public ReadOnly Property SelectedTourOpKindItem() As ListItem
        Get
            Return ddlTourOpKind.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedTourOpKind() As String
        Get
            If ddlTourOpKind.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlTourOpKind.SelectedValue
            End If
        End Get
    End Property

    'TourOpGroup
    Public ReadOnly Property SelectedTourOpGroupItem() As ListItem
        Get
            Return ddlTourOpGroup.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedTourOpGroup() As String
        Get
            If ddlTourOpGroup.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlTourOpGroup.SelectedValue
            End If
        End Get
    End Property

    'Market
    Public ReadOnly Property SelectedMarketItem() As ListItem
        Get
            Return ddlMarket.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedMarket() As String
        Get
            If ddlMarket.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlMarket.SelectedValue
            End If
        End Get
    End Property

    'Pay Condition
    Public ReadOnly Property SelectedPayCondItem() As ListItem
        Get
            Return ddlPayCond.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedPayCond() As String
        Get
            If ddlPayCond.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlPayCond.SelectedValue
            End If
        End Get
    End Property

    'TourOp
    Public ReadOnly Property SelectedTourOpItem() As ListItem
        Get
            Return ddlTourOp.SelectedItem
        End Get
    End Property

    <System.ComponentModel.Bindable(True)> _
    Public ReadOnly Property SelectedTourOp() As String
        Get
            If ddlTourOp.SelectedValue = "0" Then
                Return String.Empty
            Else
                Return ddlTourOp.SelectedValue
            End If
        End Get
    End Property

    'SelectionLevel
    Public Function SelectionLevel() As Integer
        Dim r As Integer = 0
        If ddlMarket.SelectedValue <> "0" Then r += 1
        If ddlPayCond.SelectedValue <> "0" Then r += 2
        If ddlTourOpGroup.SelectedValue <> "0" Then r += 4
        If ddlTourOp.SelectedValue <> "0" Then r += 8
        Return r
    End Function

    'ClearControl
    Public Sub ClearControl()
        exTourOpKind.SelectedValue = GetFixKindType()
        exTourOpGroup.SelectedValue = String.Empty
        exMarket.SelectedValue = String.Empty
        exPayCond.SelectedValue = String.Empty
        exTourOp.SelectedValue = String.Empty
        exMore.Collapsed = _CollapsedDefault
    End Sub

    Public Sub SetTourOp(ByVal value As Integer)
        exTourOpKind.SelectedValue = String.Empty
        exTourOpGroup.SelectedValue = String.Empty
        exMarket.SelectedValue = String.Empty
        exPayCond.SelectedValue = String.Empty
        exTourOp.SelectedValue = value
    End Sub

    Public Sub CookieLoad(ByVal cookie As HttpCookie)
        If cookie(Me.ID & "exMore") IsNot Nothing Then exMore.Collapsed = cookie(Me.ID & "exMore")
        If cookie(Me.ID & "exTourOpKind") IsNot Nothing Then exTourOpKind.SelectedValue = cookie(Me.ID & "exTourOpKind")
        If cookie(Me.ID & "exTourOpGroup") IsNot Nothing Then exTourOpGroup.SelectedValue = cookie(Me.ID & "exTourOpGroup")
        If cookie(Me.ID & "exMarket") IsNot Nothing Then exMarket.SelectedValue = cookie(Me.ID & "exMarket")
        If cookie(Me.ID & "exPayCond") IsNot Nothing Then exPayCond.SelectedValue = cookie(Me.ID & "exPayCond")
        If cookie(Me.ID & "exTourOp") IsNot Nothing Then exTourOp.SelectedValue = cookie(Me.ID & "exTourOp")
    End Sub


    Public Sub CookieSave(ByVal cookie As HttpCookie)
        cookie(Me.ID & "exMore") = exMore.Collapsed.ToString
        cookie(Me.ID & "exTourOpKind") = exTourOpKind.SelectedValue
        cookie(Me.ID & "exTourOpGroup") = exTourOpGroup.SelectedValue
        cookie(Me.ID & "exMarket") = exMarket.SelectedValue
        cookie(Me.ID & "exPayCond") = exPayCond.SelectedValue
        cookie(Me.ID & "exTourOp") = exTourOp.SelectedValue
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BulidContextKey()
        If _FixKind <> FixKindType.None Then exTourOpKind.SelectedValue = GetFixKindType()
    End Sub

    Protected Sub exMore_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles exMore.Init
        exMore.Collapsed = _CollapsedDefault
    End Sub

    Protected Sub ddlTourOpKind_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTourOpKind.Init
        ddlTourOpKind.Enabled = Not (_FixKind = FixKindType.FixSingle Or _FixKind = FixKindType.FixGroup)
    End Sub

    'ContextKey
    Private Sub BulidContextKey()
        Dim ck As String = String.Format("NoLocal:{0};", _NoLocal) & _
                           String.Format("Mandatory:{0};", _Mandatory) & _
                           String.Format("Kind:{0};", FixKindInt)
        exTourOpKind.ContextKey = ck
        exTourOpGroup.ContextKey = ck
        exMarket.ContextKey = ck
        exPayCond.ContextKey = ck
        exTourOp.ContextKey = ck
    End Sub
End Class
