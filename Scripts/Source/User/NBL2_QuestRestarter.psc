ScriptName NBL2_QuestRestarter Extends ScriptObject

Quest Property AddonQuest Auto Const

Event OnInit()

  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerLoadGame")
  Debug.Notification("[Nobody's Leaders 2] Version 3.0 initiated!")

EndEvent

Event Actor.OnPlayerLoadGame(Actor PlayerRef)

  ; This script restarts NBL2 main quest in order to re-name with realistic name to
  ; all non-named settlers from the vanilla game.
  ; It does this OnPlayerLoadGame to avoid other mods to rename them instead.
  AddonQuest.Stop()
  AddonQuest.Start()

EndEvent
