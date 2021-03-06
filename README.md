# ArtifactMenu

This is a simple World of Warcraft add-on to automate opening the Artifact interface in the upcoming expansion *Legion*. It is my first add-on and was never intended to be particularly complex. The whole point is that:

1. To open the Artifact interface, you must Shift+RightClick on your equipped Artifact weapon
2. It is easier to type `/run SocketInventoryItem(16);`, if you can save it to a macro
3. It is more intuitive to type `/am` or `/artifact` than the above macro
4. Some artifacts are off-hands and require inventory slot #17

___

This add-on will simplify all of that to just:

* `/artifact`
* `/am` (if you're lazy)
* `/artifactmenu` (if you're forgetful)

## Special Thanks

* [The idea](https://www.reddit.com/r/wow/comments/4ze7uw/psa_macro_to_quickly_open_the_artifact_weapon/) by [/u/HoLeeSchit](https://www.reddit.com/user/HoLeeSchit)
* [WoW Addon Writing Guide](http://wow.gamepedia.com/User:Cogswobble/Addon_Tutorial/Slash_Commands) by Cogswobble
* Wowpedia [slash commands reference](http://wow.gamepedia.com/Creating_a_slash_command)
* The nice people of [#wowuidev](http://us.battle.net/forums/en/wow/topic/1127130079) for helping me debug, specifically `kd3`, `Nebula`, and `Semlar`
* [Farrar-Gilneas](http://us.battle.net/wow/en/character/gilneas/Farrar/simple) for testing this add-on in the *Legion* beta.
* [/u/IHateMyHandle](https://www.reddit.com/u/IHateMyHandle), whose add-on [Incentive Program](https://mods.curse.com/addons/wow/incentive-program) served as my inspiration (and also my foundation). The entire LDB frame panel in ArtifactMenu is largely sourced from Incentive Program and I can't be thankful enough. [Incentive Program](https://mods.curse.com/addons/wow/incentive-program) is a QoL add-on (much like ArtifactMenu) which makes queuing for Call To Arms satchels as easy as possible. Go check it out!
