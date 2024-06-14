Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class ExceptionMess
    Public Shared Function GetExceptionMessInsert(ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem inserting a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If
            mess += e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If

        Return mess

    End Function
    Public Shared Function GetExceptionMessUpdate(ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem updating a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If

            e.ExceptionHandled = True
            e.KeepInEditMode = True
        End If

        Return mess

    End Function

    Public Shared Function GetExceptionMessDelete(ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem deleting a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If

            e.ExceptionHandled = True
        End If

        Return mess

    End Function


    Public Shared Function GetExceptionMessInsert(ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem inserting a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If
            Dim len As Integer = Int32.Parse(mess.IndexOf("#"))
            mess += e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True

            If len > 0 Then
                Return mess.Remove(len)
            Else
                Return mess
            End If

        Else
            Return mess
        End If

    End Function
    Public Shared Function GetExceptionMessUpdate(ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem updating a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If

            e.ExceptionHandled = True
            e.KeepInEditMode = True
        End If

        Return mess

    End Function

    Public Shared Function GetExceptionMessDelete(ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "There was a problem deleting a row. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If

            e.ExceptionHandled = True
        End If

        Return mess

    End Function
    Public Shared Function GetExceptionMessDeleteG(ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then
            mess = "Can't delete selected item. "

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If

            e.ExceptionHandled = True
        End If

        Return mess

    End Function
    Public Shared Function GetExceptionMessDS(ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) As String
        Dim mess As String
        mess = ""

        If e.Exception IsNot Nothing Then

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    mess &= inner.Message
                ElseIf TypeOf inner Is System.Data.NoNullAllowedException Then
                    mess += "There are one or more required fields that are missing."
                ElseIf TypeOf inner Is ArgumentException Then
                    Dim paramName As String = CType(inner, ArgumentException).ParamName
                    mess &= String.Concat("The ", paramName, " value is illegal.")
                ElseIf TypeOf inner Is ApplicationException Then
                    mess += inner.Message
                End If
            End If
            mess += e.Exception.Message

            Dim len As Integer = Int32.Parse(mess.IndexOf("#"))
            ' mess = mess.Remove(len + 1, mess.Length)

            e.ExceptionHandled = True

            If len > 0 Then
                Return mess.Remove(len)
            Else
                Return mess
            End If
        Else
            Return mess
        End If
    End Function
End Class
