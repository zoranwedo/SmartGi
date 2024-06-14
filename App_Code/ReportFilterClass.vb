Imports Microsoft.VisualBasic

Public Class ReportFilterClass
    Public Enum ValueType
        valInteger
        valString
        valDate
    End Enum

    Private _TypeOfValue As ValueType
    Public ReadOnly Property TypeOfValue() As ValueType
        Get
            Return _TypeOfValue
        End Get
    End Property

    Private _IntegerValue As Integer
    Public ReadOnly Property IntegerValue() As Integer
        Get
            Return _IntegerValue
        End Get
    End Property

    Private _StringValue As String
    Public ReadOnly Property StringValue() As String
        Get
            Return _StringValue
        End Get
    End Property

    Private _DateValue As Date
    Public ReadOnly Property DateValue() As Date
        Get
            Return _DateValue
        End Get
    End Property

    Private _NoValue As Boolean
    Public ReadOnly Property NoValue() As Boolean
        Get
            Return _NoValue
        End Get
    End Property
    Public ReadOnly Property HasValue() As Boolean
        Get
            Return Not _NoValue
        End Get
    End Property

    Public ReadOnly Property Value() As Object
        Get
            If _NoValue Then
                Return Nothing
            ElseIf _TypeOfValue = ValueType.valString Then
                Return _StringValue
            ElseIf _TypeOfValue = ValueType.valInteger Then
                Return _IntegerValue
            Else
                Return _DateValue
            End If
        End Get
    End Property

    Public ReadOnly Property ValueStr() As String
        Get
            If _NoValue Then
                Return "nothing"
            ElseIf _TypeOfValue = ValueType.valString Then
                Return _StringValue
            ElseIf _TypeOfValue = ValueType.valInteger Then
                Return _IntegerValue.ToString
            Else
                Return _DateValue.ToShortDateString
            End If
        End Get
    End Property

    Public Sub New(ByVal newValue As String, ByVal newType As ValueType)
        _TypeOfValue = newType
        _NoValue = String.IsNullOrEmpty(newValue)
        If Not _NoValue Then
            Try
                Select Case newType
                    Case ValueType.valInteger
                        _IntegerValue = Integer.Parse(newValue)
                    Case ValueType.valString
                        _StringValue = newValue
                    Case ValueType.valDate
                        _DateValue = Date.Parse(newValue)
                End Select
            Catch ex As Exception
                _NoValue = True
            End Try
        End If
    End Sub

    Public Sub New(ByVal newValue As String, ByVal newType As ValueType, ByVal nullValue As String)
        _TypeOfValue = newType
        _NoValue = String.IsNullOrEmpty(newValue) Or newValue = nullValue
        If Not _NoValue Then
            Try
                Select Case newType
                    Case ValueType.valInteger
                        _IntegerValue = Integer.Parse(newValue)
                    Case ValueType.valString
                        _StringValue = newValue
                    Case ValueType.valDate
                        _DateValue = Date.Parse(newValue)
                End Select
            Catch ex As Exception
                _NoValue = True
            End Try
        End If
    End Sub


    Public Function Len() As Integer
        If _NoValue Or _TypeOfValue <> ValueType.valString Then
            Return -1
        Else
            Return _StringValue.Length
        End If
    End Function

    Public Function LastDigits(ByVal i As Integer) As Boolean
        If _NoValue Or _TypeOfValue <> ValueType.valString Then
            Return False
        Else
            Dim v As Integer
            Return Integer.TryParse(Right(_StringValue, i), v)
        End If

    End Function

    Public Function Duration(ByVal f As ReportFilterClass, ByVal t As DateInterval) As Integer
        If f._TypeOfValue <> ValueType.valDate Then
            Return 1000
        ElseIf _TypeOfValue <> ValueType.valDate Then
            Return 1000
        ElseIf f.NoValue Then
            Return 1000
        ElseIf _NoValue Then
            Return 1000
        Else
            Return DateDiff(t, _DateValue, f.DateValue)
        End If
    End Function

    Public Function Range(ByVal f As ReportFilterClass) As Integer
        If f._TypeOfValue <> ValueType.valInteger Then
            Return 1000000
        ElseIf _TypeOfValue <> ValueType.valInteger Then
            Return 1000000
        ElseIf f.NoValue Then
            Return 1000000
        ElseIf _NoValue Then
            Return f.IntegerValue
        Else
            Return f.IntegerValue - _IntegerValue
        End If
    End Function



    Public Shared Function ReportTimeout(ByVal report As String) As Integer
        Dim r As Integer
        Dim t As String = ConfigurationManager.AppSettings(report)
        If String.IsNullOrEmpty(t) Then t = ConfigurationManager.AppSettings(ReportTimeout)
        If Integer.TryParse(t, r) Then
            Return r
        Else
            Return 300
        End If
    End Function

    Public Shared Function ReportPeriod(ByVal dStart As String, ByVal dFinish As String) As String
        If String.IsNullOrEmpty(dStart) And String.IsNullOrEmpty(dFinish) Then
            Return String.Empty
        Else
            Dim s As String = "*"
            Dim f As String = "*"
            If Not String.IsNullOrEmpty(dStart) Then s = dStart
            If Not String.IsNullOrEmpty(dFinish) Then f = dFinish
            Return s & " - " & f
        End If
    End Function
End Class
