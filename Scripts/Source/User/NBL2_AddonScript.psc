ScriptName NBL2_AddonScript Extends Actor

Actor[] Property AllowedToMove_List Auto Const
Actor[] Property NotAllowedToMove_List Auto Const

Event OnInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as Actor, "OnPlayerLoadGame")
  Self.MainFunction()
EndEvent

Event Actor.OnPlayerLoadGame(Actor PlayerRef)
  Self.MainFunction()
EndEvent

Function MainFunction()
  Int I = 0
  While I < AllowedToMove_List.Length
    Self.SetActorProperties(AllowedToMove_List[I], True)
    I += 1
  EndWhile

  I = 0
  While I < NotAllowedToMove_List.Length
    Self.SetActorProperties(NotAllowedToMove_List[I], False)
    I += 1
  EndWhile
EndFunction

Function SetActorProperties(Actor akActorRef, Bool allowMove)
  ; Set Commandable
  If !workshopframework:workshopfunctions.IsCommandable(akActorRef)
    workshopframework:workshopfunctions.SetCommandable(akActorRef, True)
  EndIf

  ; Set Movable
  If workshopframework:workshopfunctions.AllowMove(akActorRef) != allowMove
    workshopframework:workshopfunctions.SetAllowMove(akActorRef, allowMove)
  EndIf

  ; Set Caravan
  If !workshopframework:workshopfunctions.AllowCaravan(akActorRef)
    workshopframework:workshopfunctions.SetAllowCaravan(akActorRef, True)
  EndIf
EndFunction
