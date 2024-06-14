Imports Microsoft.VisualBasic

Public Class InvoicesRights
    Private pUser As String
    Private pState As Integer
    Private pInvoice As Integer
    Private pRights As Boolean
    Private pHotelSel As Boolean
    Private pHotelChck As Boolean
    Private pSendSel As Boolean
    Private pCanceled As Boolean
    Private pCanCanceled As Boolean
    Private pCanDeliverd As Boolean
    Private pHRev As Boolean
    Private pCCIRev As Boolean
    Private pActive As Integer ' 0 - Inactive (sent in cci, but not opened yet); 1 - Active; 2 - Canceled
    Private htl As Boolean

    Public Sub New(ByVal InvoiceID As Integer, ByVal htlchk As Boolean)
        pInvoice = InvoiceID
        pHotelChck = htlchk
        pUser = Membership.GetUser.UserName

        Dim qa As New dsInvoicesTableAdapters.QueriesTableAdapter
        pState = qa.GetInvoiceState(pInvoice)


        If (Roles.IsUserInRole(pUser, "hotel")) Then 'Or Roles.IsUserInRole(pUser, "admin")) Then
            htl = True
        ElseIf (Roles.IsUserInRole(pUser, "operator") Or Roles.IsUserInRole(pUser, "admin")) Then
            htl = False
        End If

        'pHotelSel = False
        'pSendSel = False
        'pRights = False

        'State:
        'hotel's
        '        1 - not reviewed by hotel            
        '        2 - reviewed by hotel  (can send)
        '        -3 - canceled by hotel
        'cci's
        '        4 - not reviewed by cci            
        '        5 - reviewed by cci  (can set DeliverdDate)
        '        6 - modified by cci
        '        -7 - canceled by cci


        pSendSel = False
        pHotelSel = False
        pCanCanceled = False
        pCanDeliverd = False

        If (pState <> -3 And pState <> -7) Then  ' not canceled 
            'Select Case pState
            '    Case 1              'hotel - not reviewed
            '        If htl Then
            '            pSendSel = False 'can't send not reviewed invoice
            '            pRights = True
            '            pCanCanceled = True
            '        Else
            '            pRights = False
            '        End If

            '    Case 2              'hotel - reviewed
            '        If htl Then
            '            pSendSel = True
            '            pRights = True
            '            pCanCanceled = True
            '        Else
            '            pRights = False
            '        End If

            '    Case 4           ' cci - not reviewed
            '        If htl Then
            '            pRights = False

            '        Else
            '            pHotelSel = True
            '            pCanCanceled = False
            '            If (pHotelChck) Then
            '                pRights = False
            '            Else
            '                pRights = True
            '            End If
            '        End If
            '    Case 5, 6           ' cci - reviewed
            '        If htl Then
            '            pRights = False
            '        Else
            '            pHotelSel = True
            '            pCanCanceled = True
            '            If (pHotelChck) Then
            '                pRights = False
            '            Else
            '                pRights = True
            '            End If
            '            pCanDeliverd = True
            '        End If
            '        pCanceled = False
            '        pActive = 1
            'End Select
            pRights = (pState > 3 And Not htl) Or (pState < 3 And htl)
            If (htlchk = True And Not htl) Then pRights = False
            pHotelSel = Not htl
            pHRev = pState < 4 And htl
            pCCIRev = pState > 3 And Not htl
            pSendSel = pState = 2 And htl
            pCanDeliverd = (pState = 5 Or pState = 6) And Not htl
        Else 'canceled
            'pActive = 2  ' canceled
            'pRights = False
            'Select Case pState

            '    Case -3              'hotel
            '        If htl Then
            '            pCanCanceled = True
            '        End If

            '    Case -7           ' cci
            '        pActive = 0 ' inactive

            '    Case 3
            '        If Not htl Then
            '            pCanCanceled = True
            '        End If
            'End Select
            pHRev = False
            pCCIRev = False
            pSendSel = False
            pCanceled = True
            pRights = False

        End If

        'If qa.GetDeliveryDate(pInvoice) IsNot Nothing Then
        '    pRights = False
        'End If

    End Sub
    Public ReadOnly Property Rights() As Boolean
        Get
            Return pRights
        End Get
    End Property
    Public ReadOnly Property CanDelivered() As Boolean
        Get
            Return pCanDeliverd
        End Get
    End Property
    Public ReadOnly Property HotelSel() As Boolean
        Get
            Return pHotelSel
        End Get
    End Property
    Public ReadOnly Property SendSel() As Boolean
        Get
            Return pSendSel
        End Get
    End Property
    Public ReadOnly Property Active() As Integer
        Get
            Return pActive
        End Get
    End Property
    Public ReadOnly Property StateDisplay() As String
        Get
            Dim disp As String = Nothing

            Select Case pActive
                Case 1, 4
                    disp = "Inactive"
                Case 2, 5, 6
                    disp = "Active"
                Case Is = 3, -7
                    disp = "Canceled"
            End Select
            Return disp
        End Get
    End Property
    Public ReadOnly Property Canceled() As Boolean
        Get
            Return pCanceled
        End Get
    End Property
    Public ReadOnly Property CanCanceled() As Boolean
        Get
            Return pCanCanceled
        End Get
    End Property
    Public ReadOnly Property SetHtlChk() As Boolean
        Get
            If htl Then
                pHotelChck = True
            Else
                pHotelChck = False

            End If

            Return pHotelChck
        End Get
    End Property
    Public ReadOnly Property HAmount() As Boolean
        Get
            Dim ham As Boolean

            If htl Then
                ham = True
            Else
                If pHotelChck Then
                    ham = True
                Else
                    ham = False
                End If

            End If

            Return ham
        End Get
    End Property

End Class
