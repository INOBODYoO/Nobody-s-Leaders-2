ScriptName NBL2_VTW_Patch Extends ScriptObject

Actor[] Property Habitants_List Auto Const

Event OnInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerLoadGame")
  Self.MainFunction()
EndEvent

Event Actor.OnPlayerLoadGame(Actor PlayerRef)
  Self.MainFunction()
EndEvent

Function MainFunction()
  Int I = 0
  While I < Habitants_List.Length
    Self.SetActorProperties(Habitants_List[I], False)
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