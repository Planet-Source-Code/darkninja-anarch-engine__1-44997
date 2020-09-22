VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H80000007&
   Caption         =   "AnarchEngine"
   ClientHeight    =   7245
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7875
   BeginProperty Font 
      Name            =   "Small Fonts"
      Size            =   6.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7245
   ScaleWidth      =   7875
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4080
      Top             =   2640
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4935
      Left            =   0
      ScaleHeight     =   4905
      ScaleWidth      =   7785
      TabIndex        =   0
      Top             =   0
      Width           =   7815
      Begin VB.Image Ninja 
         Height          =   690
         Left            =   3360
         Picture         =   "Form1.frx":0000
         Top             =   3000
         Width           =   315
      End
      Begin VB.Image Picture3 
         Height          =   270
         Left            =   1080
         Picture         =   "Form1.frx":0BC2
         Top             =   1320
         Width           =   780
      End
   End
   Begin VB.Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "HP"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   5640
      TabIndex        =   1
      Top             =   5400
      Width           =   495
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   1695
      Left            =   5520
      Top             =   5160
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Set User.Character = Picture5
End Sub

Private Sub Command2_Click()
Call Jump
End Sub

Private Sub Command3_Click()
Call GetItem("Sword", 2000)
End Sub

Private Sub Command4_Click()
Call SellItem("Sword", 2000)
End Sub

Private Sub Command6_Click()
Call ChangeCharacter("JetpackJoe")
End Sub
Private Sub Command7_Click()
Call ChangeCharacter("NormalJoe")
End Sub

Private Sub Form_Load()
Set User.Character = Ninja
Set User.GameBox = Picture1
Set User.Wall(1) = Picture3
End Sub

Private Sub Picture1_KeyDown(KeyCode As Integer, Shift As Integer)
Call FilterMovementBox(KeyCode)
Call FilterMovement1(KeyCode)
End Sub

