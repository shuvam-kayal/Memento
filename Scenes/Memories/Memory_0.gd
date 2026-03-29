extends Node

# ---------------------------------------------------------------------------
# MEMORY 0 — A Toy (Flashback Scene)
# A non-playable 3D sequence. She plays with her brother as a child.
#
# Scene tree expected:
#   Memory0_Flashback (this script)
#   ├── World (Node3D)               ← drop your pre-made 3D scene here
#   ├── AudioStreamPlayer            ← assign your music track in Inspector
#   ├── CanvasLayer
#   │   ├── FadeOverlay (ColorRect)  ← full screen, black, anchored full rect
#   │   └── NarrationLabel (RichTextLabel)
#   └── AnimationPlayer              ← drives your character animations
# ---------------------------------------------------------------------------

const MAIN_SCENE = "res://Scenes/Level_01.tscn"

# How long the memory plays before fading out
@export var memory_duration: float = 8.0

# Fade durations
@export var fade_in_duration:  float = 1.5
@export var fade_out_duration: float = 2.0

# Music fade
@export var music_fade_in_duration:  float = 2.0
@export var music_fade_out_duration: float = 2.0

@onready var fade_overlay     = $CanvasLayer/FadeOverlay
@onready var narration_label  = $CanvasLayer/NarrationLabel
@onready var music_player     = $AudioStreamPlayer
@onready var world            = $World
@onready var anim_player      = $AnimationPlayer

func _ready():
	# Lock out any player input — this is non-interactive
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Start black, hide content
	fade_overlay.color = Color(0, 0, 0, 1)
	narration_label.visible = false

	# Music starts silent, will fade in
	music_player.volume_db = -80.0
	#music_player.play()

	await get_tree().process_frame
	_play_memory()

func _play_memory():
	# --- FADE IN (screen + music together) ---
	var fade_tween = create_tween().set_parallel(true)
	fade_tween.tween_property(fade_overlay, "color:a", 0.0, fade_in_duration)
	fade_tween.tween_property(music_player, "volume_db", 0.0, music_fade_in_duration)
	await fade_tween.finished

	# --- PLAY CHARACTER ANIMATION ---
	# Uncomment once your animation is ready:
	# anim_player.play("Memory0_BrotherPlay")

	# --- NARRATION (optional, remove if not needed) ---
	narration_label.visible = true
	narration_label.text = "[center][i]She remembers playing with her brother...[/i][/center]"

	# --- HOLD ON MEMORY ---
	await get_tree().create_timer(memory_duration).timeout

	# --- FADE OUT (screen + music together) ---
	narration_label.visible = false
	var fade_out_tween = create_tween().set_parallel(true)
	fade_out_tween.tween_property(fade_overlay, "color:a", 1.0, fade_out_duration)
	fade_out_tween.tween_property(music_player, "volume_db", -80.0, music_fade_out_duration)
	await fade_out_tween.finished

	# --- RETURN TO MAIN SCENE ---
	get_tree().change_scene_to_file(MAIN_SCENE)
