
Partial Class Contracts_Create_CreateCnt
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

    Protected Sub GetStart_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Start As Nullable(Of Date) = Nothing
        Dim ddlHotels As DropDownList = fvNewContract.FindControl("ddlHotels")
        Dim ddlTO As DropDownList = fvNewContract.FindControl("ddlTO")
        Dim txtStart As TextBox = fvNewContract.FindControl("txtStart")
        Dim txtFinish As TextBox = fvNewContract.FindControl("txtFinish")

        If String.IsNullOrEmpty(ddlHotels.SelectedValue) Or String.IsNullOrEmpty(ddlTO.SelectedValue) Then
            popShow(False, "Error creating contract", "Select Hotel and TO!")
        Else
            Try
                Dim q As New ContractsTableAdapters.QueriesTableAdapter
                q.ContractGetStartNew(Int32.Parse(ddlHotels.SelectedValue), Int32.Parse(ddlTO.SelectedValue))
                Start = q.GetReturnValue(3)
                txtStart.Text = Format(Start, "d")
                If Start IsNot Nothing Then txtFinish.Text = Format(Start.Value.AddYears(1), "d")
            Catch ex As Exception
                popShow(False, "Error inserting contract", ex.Message)
            End Try
        End If
    End Sub

    Protected Sub dsContract_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContract.Inserted
        Dim str As String = e.OutputParameters.Item("NewID")
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting contract", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            If Not (String.IsNullOrEmpty(str)) Then
                Response.Redirect(String.Format("~/Contracts/Wizard/Detail.aspx?ContractID={0}", str))
            End If
        End If
    End Sub

    Protected Sub fvNewContract_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvNewContract.ItemInserting
        'If String.IsNullOrEmpty(e.Values("Start")) Then
        '    popShow(False, "Error creating contract", "Start is required field!")
        '    e.Cancel = True
        'ElseIf String.IsNullOrEmpty(e.Values("Finish")) Then
        '    popShow(False, "Error creating contract", "End is required field!")
        '    e.Cancel = True
        'ElseIf String.IsNullOrEmpty(e.Values("Year")) Then
        '    popShow(False, "Error creating contract", "Year is required field!")
        '    e.Cancel = True
        'Else
        'Dim p As New ContractsTableAdapters.ContractTitleTableAdapter
        'Dim c As Integer = Not p.IsValidTitleForYear(e.Values("Title"), e.Values("Year"))

        'If c = 0 Then
        '    popShow(False, "Error creating contractr", "Title is not corresponding with year!")
        '    e.Cancel = True
        'Else
        Dim qr As New ContractsTableAdapters.QueriesTableAdapter
        Dim h As Integer = e.Values("HotelID")
        Dim t As Integer = e.Values("TourOpId")
        Dim s As Date = e.Values("Start")
        Dim f As Date = e.Values("Finish")
        Dim cbe As AjaxControlToolkit.ConfirmButtonExtender = CType(fvNewContract.FindControl("cbeInsertButton"), AjaxControlToolkit.ConfirmButtonExtender)

        qr.VAL_PreContractOverlaps(h, t, s, f)
        Dim c As Integer = qr.GetReturnValue(0)
        Dim m As String = "There are consistent contract for that hotel, tour operator overlapping specified contracting window."
        m &= vbNewLine & "Do you want to create contract anyway?"
        cbe.ConfirmText = m
        cbe.Enabled = True
        'End If
        'End If
    End Sub
End Class
