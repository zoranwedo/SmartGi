<System.ComponentModel.DefaultBindingProperty("SelectedTourOp")> _
Partial Class App_UserControls_TourOpControl
    Inherits System.Web.UI.UserControl

    Public Property Enabled() As Boolean
        Get
            Return ddlTourOp.Enabled
        End Get
        Set(ByVal value As Boolean)
            ddlTourOp.Enabled = value
        End Set
    End Property

    Private _LabelWidth As Unit
    Public Property LabelWidth() As Unit
        Get
            Return _LabelWidth
        End Get
        Set(ByVal value As Unit)
            _LabelWidth = value
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

    'TourOp
    Public Property SelectedTourOpIndex() As Integer
        Get
            Return ddlTourOp.SelectedIndex
        End Get
        Set(ByVal value As Integer)
            ddlTourOp.SelectedIndex = value
        End Set
    End Property

    Public Property SelectedTourOpValue() As String
        Get
            Return exTourOp.SelectedValue
        End Get
        Set(ByVal value As String)
            exTourOp.SelectedValue = value
        End Set
    End Property

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
        If ddlTourOp.SelectedValue <> "0" Then r += 8
        Return r
    End Function

    'ClearControl
    Public Sub ClearControl()
        exTourOp.SelectedValue = String.Empty
    End Sub

    'Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BulidContextKey()

        Dim c As ClientScriptManager = Me.Page.ClientScript
        If Not c.IsStartupScriptRegistered(Me.GetType(), "t_Startup") Then
            Dim scriptString As String = _
                "<script type='text/javascript'> " & vbNewLine & _
                "document.getElementById('td_t_TourOpLabel').className='" & _LabelCssClass & "';" & vbNewLine & _
                "document.getElementById('td_t_TourOpLabel').width='" & _LabelWidth.ToString() & "';" & vbNewLine & _
                "document.getElementById('td_t_TourOpControl').width='" & _ControlWidth.ToString() & "';" & vbNewLine & _
                "</script>"
            c.RegisterStartupScript(Me.GetType(), "t_Startup", scriptString)
        End If
    End Sub

    'ContextKey
    Private Sub BulidContextKey()
        Dim ck As String = "NoLocal:" & _NoLocal.ToString() & ";Mandatory:" & _Mandatory.ToString()
        exTourOp.ContextKey = ck
    End Sub

End Class
