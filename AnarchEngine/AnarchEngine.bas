Attribute VB_Name = "AnarchEngine"
'----------------------------------------------------------
'        - AnarchEngine 1.2 coded by Anarch Gaming -
'----------------------------------------------------------

'1.0 Functions:
' - ChangeCharacter: Loads a new character image
' - FilterMovement.: Filters the movement by checking for collisions
' - Jump...........: Makes the character jump
' - Walk...........: Makes the character move at any variable (speed)

'1.2 Functions:
' - GetItem........: Allows you to buy an item and add it to your inventory

Global User  As CharacterInfo

Public Type CharacterInfo
'----------------------------
Xposition          As Integer
Yposition          As Integer
Character            As Image
GameBox         As PictureBox
Obstruction         As String
Wall(2)                As Image
'----------------------------
Inventory          As ListBox
Creds              As Integer
End Type

Sub Pause(interval)
On Error Resume Next: Current = Timer: Do While Timer - Current < Val(interval): DoEvents: Loop
End Sub

'----------------------------------------------------------
'========================Basic Functions===================
'----------------------------------------------------------

Function ChangeCharacter(Who As String)
Select Case Who

Case "NormalJoe"
    User.Character.Picture = LoadPicture(App.Path & "/testchar.bmp")
    User.GameBox.SetFocus

Case "JetpackJoe"
    User.Character.Picture = LoadPicture(App.Path & "/testcharJ.bmp")
    User.GameBox.SetFocus

End Select
End Function
Function Walk(Direction As String, Speed As Integer)
Select Case Direction

Case "UP"
    User.Character.Top = User.Character.Top - (Speed)
    
Case "DOWN"
    User.Character.Top = User.Character.Top + (Speed)

Case "LEFT"
    User.Character.Left = User.Character.Left - (Speed)

Case "RIGHT"
    User.Character.Left = User.Character.Left + (Speed)
    
End Select
End Function

Function GameboxWalk(Direction As String, Speed As Integer)
Select Case Direction

Case "UP"
    User.GameBox.Top = User.GameBox.Top + (Speed)
    Call Walk("UP", 75)
    
Case "DOWN"
    User.GameBox.Top = User.GameBox.Top - (Speed)
    Call Walk("DOWN", 75)
    
Case "LEFT"
    User.GameBox.Left = User.GameBox.Left + (Speed)
    Call Walk("LEFT", 75)
    
Case "RIGHT"
    User.GameBox.Left = User.GameBox.Left - (Speed)
    Call Walk("RIGHT", 75)
    
End Select
End Function


Function FilterMovementBox(Key As Integer)
Select Case Key

Case vbKeyUp
    If User.Character.Top <= User.GameBox.Top Then Exit Function
        Call GameboxWalk("UP", 75)
        User.Yposition = User.Yposition + 1

Case vbKeyDown
    If User.Character.Top + User.Character.Height + 75 >= User.GameBox.Top + User.GameBox.Height Then Exit Function
        Call GameboxWalk("DOWN", 75)
        User.Yposition = User.Yposition - 1

Case vbKeyRight
    If User.Character.Left + User.Character.Width + 75 >= User.GameBox.Width Then Exit Function
        Call GameboxWalk("RIGHT", 75)
        User.Xposition = User.Xposition + 1

Case vbKeyLeft
    If User.Character.Left <= 0 Then Exit Function
        Call GameboxWalk("LEFT", 75)
        User.Xposition = User.Xposition - 1
    
End Select
End Function
Function FilterMovement1(Key As Integer)
Select Case Key

Case vbKeyUp
    If User.Character.Top >= (User.Wall(1).Top + User.Wall(1).Height) Then Exit Function
     If User.Character.Left >= (User.Wall(1).Left + User.Wall(1).Width) Then Exit Function
      If User.Character.Left + User.Character.Width <= User.Wall(1).Left Then Exit Function
       If User.Character.Top <= User.Wall(1).Top Then Exit Function
        Call GameboxWalk("DOWN", 75)
        User.Yposition = User.Yposition + 1

Case vbKeyDown
    If User.Character.Top + User.Character.Height <= User.Wall(1).Top Then Exit Function
     If User.Character.Left + User.Character.Width <= User.Wall(1).Left Then Exit Function
      If User.Character.Left >= (User.Wall(1).Left + User.Wall(1).Width) Then Exit Function
       If User.Character.Top + User.Character.Height >= User.Wall(1).Top + User.Wall(1).Height Then Exit Function
        Call GameboxWalk("UP", 75)
        User.Yposition = User.Yposition - 1

Case vbKeyRight
    If User.Character.Left + User.Character.Width <= User.Wall(1).Left Then Exit Function
     If User.Character.Top + User.Character.Height <= User.Wall(1).Top Then Exit Function
      If User.Character.Top >= (User.Wall(1).Top + User.Wall(1).Height) Then Exit Function
       If User.Character.Left + User.Character.Width >= User.Wall(1).Left + User.Wall(1).Width Then Exit Function
        Call GameboxWalk("LEFT", 75)
        User.Xposition = User.Xposition - 1

Case vbKeyLeft
    If User.Character.Left >= (User.Wall(1).Left + User.Wall(1).Width) Then Exit Function
     If User.Character.Top >= (User.Wall(1).Top + User.Wall(1).Height) Then Exit Function
      If User.Character.Top + User.Character.Height <= User.Wall(1).Top Then Exit Function
       If User.Character.Left <= User.Wall(1).Left Then Exit Function
        Call GameboxWalk("RIGHT", 75)
        User.Xposition = User.Xposition + 1
    
End Select
End Function

'----------------------------------------------------------
'=====================Inventory Functions==================
'----------------------------------------------------------

Function GetItem(ItemName, Price)
If Price > User.Creds Then Exit Function
User.Creds = User.Creds - Price
User.Inventory.AddItem ItemName
End Function

Function SellItem(ItemName, Price)
'This isnt 100% yet.. its just temporary, really
For x = 0 To User.Inventory.ListCount
If User.Inventory.List(x) = ItemName Then
User.Inventory.RemoveItem (x)
End If
Next

User.Creds = User.Creds + Price
End Function










