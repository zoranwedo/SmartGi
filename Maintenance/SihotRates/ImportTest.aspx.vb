Imports SHOT_Rates

Partial Class Maintenance_SihotRates_ImportTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim sRates As New SIHOTRates
            DropDownList1.DataSource = sRates.ImportedFiles
            DropDownList1.DataTextField = "FileDescr"
            DropDownList1.DataValueField = "FILEID"
            DropDownList1.DataBind()
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim sRates As New SIHOTRates
        sRates.DeleteAll()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Import
        If FileUpload1.HasFile Then
            Dim fileID As Integer
            Dim sRates As New SIHOTRates
            Dim fileNAME = Server.MapPath("../../Uploaded/" & FileUpload1.FileName)
            FileUpload1.SaveAs(fileNAME)
            Dim dRates As SIHOTRatesDataSet = sRates.GetRatesFromXML(fileNAME)
            sRates.SaveRates(dRates)
            fileID = sRates.ImportFileID
            sRates.TransformRates(fileID)

            gvCtr.DataSource = sRates.ImportedContracts(fileID)
            gvSpo.DataSource = sRates.ImportedSpecials(fileID)
            gvSupp.DataSource = sRates.ImportedSuplementsGeneral(fileID)
            gvChgSupp.DataSource = sRates.ImportedSuplementsCharging(fileID)
            gvCtr.DataBind()
            gvSpo.DataBind()
            gvSupp.DataBind()
            gvChgSupp.DataBind()
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim fileID As Integer
        If Integer.TryParse(DropDownList1.SelectedValue, fileID) Then
            Dim sRates As New SIHOTRates
            gvCtr.DataSource = sRates.ImportedContracts(fileID)
            gvSpo.DataSource = sRates.ImportedSpecials(fileID)
            gvSupp.DataSource = sRates.ImportedSuplementsGeneral(fileID)
            gvChgSupp.DataSource = sRates.ImportedSuplementsCharging(fileID)
            gvCtr.DataBind()
            gvSpo.DataBind()
            gvSupp.DataBind()
            gvChgSupp.DataBind()
        End If
    End Sub
End Class
