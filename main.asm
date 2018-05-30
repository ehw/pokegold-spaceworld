INCLUDE "constants.asm"

SECTION "PlaceWaitingText", ROMX[$4000],BANK[$01]
INCLUDE "engine/link/place_waiting_text.asm"

SECTION "Title screen", ROMX[$5D8C],BANK[$01]
INCLUDE "engine/title.asm"

SECTION "Title Screen Sprites", ROMX[$5EB8], BANK[$01]
TitleFireGFX::
INCBIN "gfx/title/fire.2bpp"
TitleNotesGFX::
INCBIN "gfx/title/notes.2bpp"

SECTION "Predef pointers", ROMX[$62B0],BANK[$01]
INCLUDE "engine/predef.asm"

SECTION "Main Menu Definition", ROMX[$5418], BANK[$01]
MainMenuHeader:
	db $40
	db 0, 0, 7, 13
	dw .data
	db 1 ; default option

.data
	db $80
	db 0 ; number of options

	dw $5461
	db $8a, $1f
	dw MainMenuStrings

MainMenuStrings: ; 01:5428
    db "つづきから　はじめる@"
    db "さいしょから　はじめる@"
    db "せっていを　かえる@"
    db "#を　あそぶ@"
    db "じかんセット@"
; 01:5457

SECTION "Mon Nest Icon", ROMX[$4A0F], BANK[$02]
PokedexNestIconGFX::
INCBIN "gfx/pokegear/dexmap_nest_icon.1bpp"

SECTION "Bank 2 Misc GFX", ROMX[$44bf], BANK[$02]
INCBIN "gfx/overworld/gfx_84bf.2bpp"
JumpShadowGFX::
INCBIN "gfx/overworld/shadow.2bpp"
ShockEmoteGFX::
INCBIN "gfx/overworld/shock.2bpp"
QuestionEmoteGFX::
INCBIN "gfx/overworld/question.2bpp"
HappyEmoteGFX::
INCBIN "gfx/overworld/happy.2bpp"

SECTION "Pokegear GFX", ROMX[$4F32], BANK[$02]
PokegearGFX::
INCBIN "gfx/pokegear/pokegear.2bpp"

SECTION "Unused SGB Border GFX", ROMX[$62CC], BANK[$02]
UnusedSGBBorderGFX::
INCBIN "gfx/sgb/sgb_border_alt.2bpp"

SECTION "SGB Border GFX", ROMX[$6B1C], BANK[$02]
SGBBorderGFX::
INCBIN "gfx/sgb/sgb_border.2bpp"

SECTION "Title Screen GFX", ROMX[$47CF], BANK[$04]
TitleScreenGFX::
INCBIN "gfx/title/title.2bpp"

SECTION "Mail Icon GFX", ROMX[$5BB1], BANK[$04]
MailIconGFX::
INCBIN "gfx/icons/mail.2bpp"

SECTION "TM/HM Moves", ROMX[$52D1],BANK[$04]
INCLUDE "data/moves/tmhm_moves.asm"

SECTION "Trainer Card GFX", ROMX[$7171], BANK[$04]
TrainerCardGFX::
INCBIN "gfx/trainer_card/trainer_card.2bpp"
TrainerCardLeadersGFX::
INCBIN "gfx/trainer_card/leaders.2bpp"

SECTION "Unused Leader", ROMX[$7BA3], BANK[$04]
UnusedLeaderNameGFX::
INCBIN "gfx/trainer_card/unused_leader_name.2bpp"

SECTION "Gameboy GFX", ROMX[$5641], BANK[$0A]
TradeGameBoyGFX::
INCBIN "gfx/trade/gameboy.2bpp"

SECTION "Type Matchups", ROMX[$506D],BANK[$0D]
INCLUDE "data/types/type_matchups.asm"

INCLUDE "data/trainers/parties.asm"

SECTION "Alphabetical Pokedex Order", ROMX[$4943],BANK[$10]
INCLUDE "data/pokemon/dex_order_alpha.asm"

SECTION "Evolutions and Attacks", ROMX[$6493],BANK[$10]
INCLUDE "data/pokemon/evos_attacks.asm"

SECTION "Pokedex GFX", ROMX[$40D5], BANK[$11]
PokedexButtonsGFX::
INCBIN "gfx/pokedex/buttons.2bpp"
PokedexPokeBallGFX::
INCBIN "gfx/pokedex/poke_ball.2bpp"
PokedexCursorsGFX::
INCBIN "gfx/pokedex/cursors.2bpp"
PokedexSearchGFX::
INCBIN "gfx/pokedex/search.2bpp"

SECTION "Base Data", ROMX[$4F10],BANK[$14]
INCLUDE "data/pokemon/base_stats.asm"

SECTION "PKMN Sprite Bank List", ROMX[$725C], BANK[$14]
INCLUDE "gfx/pokemon/pkmn_pic_banks.asm"

INCLUDE "gfx/pokemon/pkmn_pics.asm"

SECTION "Annon Pic Ptrs and Pics", ROMX[$4d6a], BANK[$1f]
INCLUDE "gfx/pokemon/annon_pic_ptrs.asm"
INCLUDE "gfx/pokemon/annon_pics.asm"

SECTION "Attack Animation GFX", ROMX[$4000], BANK[$21]
INCBIN "gfx/battle_anims/attack_animations.2bpp"

SECTION "Pokemon Party Sprites", ROMX[$60CC], BANK[$23]
NyoromoIcon::
INCBIN "gfx/icons/nyoromo.2bpp"
PurinIcon::
INCBIN "gfx/icons/purin.2bpp"
DigdaIcon::
INCBIN "gfx/icons/digda.2bpp"
PikachuIcon::
INCBIN "gfx/icons/pikachu.2bpp"
HitodemanIcon::
INCBIN "gfx/icons/hitodeman.2bpp"
KoikingIcon::
INCBIN "gfx/icons/koiking.2bpp"
PoppoIcon::
INCBIN "gfx/icons/poppo.2bpp"
SidonIcon::
INCBIN "gfx/icons/sidon.2bpp"
PippiIcon::
INCBIN "gfx/icons/pippi.2bpp"
NazonokusaIcon::
INCBIN "gfx/icons/nazonokusa.2bpp"
MushiIcon::
INCBIN "gfx/icons/mushi.2bpp"
GangarIcon::
INCBIN "gfx/icons/gangar.2bpp"
LaplaceIcon::
INCBIN "gfx/icons/laplace.2bpp"
BarrierdIcon::
INCBIN "gfx/icons/barrierd.2bpp"
LokonIcon::
INCBIN "gfx/icons/lokon.2bpp"
KentaurosIcon::
INCBIN "gfx/icons/kentauros.2bpp"
ShellderIcon::
INCBIN "gfx/icons/shellder.2bpp"
MetamonIcon::
INCBIN "gfx/icons/metamon.2bpp"
IwarkIcon::
INCBIN "gfx/icons/iwark.2bpp"
BiriridamaIcon::
INCBIN "gfx/icons/biriridama.2bpp"
ZenigameIcon::
INCBIN "gfx/icons/zenigame.2bpp"
FushigidaneIcon::
INCBIN "gfx/icons/fushigidane.2bpp"
HitokageIcon::
INCBIN "gfx/icons/hitokage.2bpp"
BeedleIcon::
INCBIN "gfx/icons/beedle.2bpp"
AnnonIcon::
INCBIN "gfx/icons/annon.2bpp"
IsitsubuteIcon::
INCBIN "gfx/icons/isitsubute.2bpp"
WanrikyIcon::
INCBIN "gfx/icons/wanriky.2bpp"
TamagoIcon::
INCBIN "gfx/icons/tamago.2bpp"
MenokurageIcon::
INCBIN "gfx/icons/menokurage.2bpp"
ButterfreeIcon::
INCBIN "gfx/icons/butterfree.2bpp"
ZubatIcon::
INCBIN "gfx/icons/zubat.2bpp"
KabigonIcon::
INCBIN "gfx/icons/kabigon.2bpp"

SECTION "Slot Machine GFX", ROMX[$4FDB], BANK[$24]
SlotMachineGFX::
INCBIN "gfx/minigames/slots.2bpp"
SlotMachine2GFX::
INCBIN "gfx/minigames/slots_2.2bpp"

SECTION "Poker GFX", ROMX[$5403], BANK[$38]
PokerGFX::
INCBIN "gfx/minigames/poker.2bpp"

SECTION "15 Puzzle GFX", ROMX[$5F93], BANK[$38]
FifteenPuzzleGFX::
INCBIN "gfx/minigames/15_puzzle.2bpp"

SECTION "Matches GFX", ROMX[$6606], BANK[$38]
MemoryGameGFX::
INCBIN "gfx/minigames/matches.2bpp"

SECTION "Picross GFX", ROMX[$75B7], BANK[$38]
PicrossGFX::
INCBIN "gfx/minigames/picross.2bpp"
PicrossCursorGFX::
INCBIN "gfx/minigames/picross_cursor.2bpp"

SECTION "Gamefreak Logo GFX", ROMX[$41FF], BANK[$39]
GameFreakLogoGFX::
INCBIN "gfx/splash/game_freak_logo.1bpp"
GameFreakLogoSparkleGFX::
INCBIN "gfx/splash/game_freak_logo_oam.2bpp"

SECTION "Intro Underwater GFX", ROMX[$4ADF], BANK[$39]
IntroUnderwaterGFX::
INCBIN "gfx/intro/underwater.2bpp"

SECTION "Intro Water Mon and Forest GFX", ROMX[$55EF], BANK[$39]
IntroWaterPokemonGFX::
INCBIN "gfx/intro/water_pokemon.2bpp"
IntroForestGFX::
INCBIN "gfx/intro/forest.2bpp"

SECTION "Intro Mon", ROMX[$626F], BANK[$39]
IntroPurinPikachuGFX::
INCBIN "gfx/intro/purin_pikachu.2bpp"
IntroLizardon1GFX::
INCBIN "gfx/intro/lizardon_1.2bpp"
IntroLizardon2GFX::
INCBIN "gfx/intro/lizardon_2.2bpp"
IntroLizardon3GFX::
INCBIN "gfx/intro/lizardon_3.2bpp"
IntroLizardonFlamesGFX::
INCBIN "gfx/intro/lizardon_flames.2bpp"
IntroKamexGFX::
INCBIN "gfx/intro/kamex.2bpp"
IntroFushigibanaGFX::
INCBIN "gfx/intro/fushigibana.2bpp"

SECTION "Misc GFX", ROMX[$4162], BANK[$3E]
FontExtraGFX::
INCBIN "gfx/font/font_extra.2bpp"
FontGFX::
INCBIN "gfx/font/font.1bpp"
FontBattleExtraGFX::
INCBIN "gfx/font/font_battle_extra.2bpp"
INCBIN "gfx/frames/frames.1bpp"
StatsSeparatorGFX::
INCBIN "gfx/stats/separator.2bpp"
StatsGFX::
INCBIN "gfx/stats/stats.2bpp"
HPExpBarBorderGFX::
INCBIN "gfx/battle/hp_exp_bar_border.1bpp"
ExpBarGFX::
INCBIN "gfx/battle/exp_bar.2bpp"
PokedexUnitsGFX::
INCBIN "gfx/pokedex/m_kg.2bpp"
PokedexGFX::
INCBIN "gfx/pokedex/pokedex.2bpp"
TownMapGFX::
INCBIN "gfx/pokegear/town_map.2bpp"
HUD_GFX::
INCBIN "gfx/hud/hud.2bpp"
BoldAlphabetGFX::
INCBIN "gfx/font/alphabet.1bpp"
AnnonAlphabetGFX::
INCBIN "gfx/font/annon_alphabet.1bpp"
INCBIN "gfx/font/gfx_f9322.1bpp"
PackIconGFX::
INCBIN "gfx/pack/pack_icons.2bpp"

SECTION "Town Map Cursor", ROMX[$506F], BANK[$3F]
TownMapCursorGFX::
INCBIN "gfx/pokegear/town_map_cursor.2bpp"
