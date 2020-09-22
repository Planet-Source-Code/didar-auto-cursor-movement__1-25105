VERSION 5.00
Begin VB.Form moveit 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "A Program To Change Cursor Position."
   ClientHeight    =   2685
   ClientLeft      =   1680
   ClientTop       =   1605
   ClientWidth     =   4425
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "MOVEIT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2685
   ScaleWidth      =   4425
   Begin VB.CommandButton Command2 
      Caption         =   "End"
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   720
      Width           =   735
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   3000
      Top             =   1200
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      Caption         =   "Command1"
      Height          =   525
      Left            =   4920
      TabIndex        =   0
      Top             =   360
      Width           =   1245
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "General Corporation Bangladesh"
      Height          =   195
      Left            =   840
      TabIndex        =   3
      Top             =   2400
      Width           =   2760
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Demo Cursor Movement Program."
      Height          =   195
      Left            =   840
      TabIndex        =   2
      Top             =   2160
      Width           =   2835
   End
End
Attribute VB_Name = "moveit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim X, Y As Integer

'TNC API Declaration

Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long


Private Sub Command1_Click()
 Dim P As POINTAPI
 SaveMode% = Me.ScaleMode
 Me.ScaleMode = 3
 P.X = Command2.Left + (Command2.Width) / 2
 P.Y = Command2.Top + (Command2.Height) / 2
 ClientToScreen Me.hwnd, P
 SetCursorPos P.X, P.Y
 Me.ScaleMode = SaveMode%
End Sub






Private Sub Command2_Click()
End
End Sub

Private Sub Form_Load()
X = 0
Y = 0
SetCursorPos 640, 480
  If WindowState = 0 Then
    Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2
  End If
  Show
End Sub



Private Sub Timer1_Timer()

If X = 200 Then
X = X
Y = Y - 2
Else
X = X + 2
Y = Y + 2
End If

 SetCursorPos X, Y
  End Sub
