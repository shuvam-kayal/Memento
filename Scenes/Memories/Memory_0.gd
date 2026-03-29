extends Node

# ---------------------------------------------------------------------------
# MEMORY 0 — A Toy (Flashback Scene)
# ---------------------------------------------------------------------------

const MAIN_SCENE = "res://Scenes/Level_01.tscn"

@export var fade_in_duration:  float = 1.5
@export var fade_out_duration: float = 2.0
@export var music_fade_in_duration:  float = 2.0
@export var music_fade_out_duration: float = 2.0

@onready var fade_overlay  = $CanvasLayer/FadeOverlay
@onready var music_player  = $AudioStreamPlayer
@onready var anim_player   = $AnimationPlayer

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	fade_overlay.color = Color(0, 0, 0, 1)

	# music_player.volume_db = -80.0
	# music_player.play()

	await get_tree().process_frame
	_play_memory()

func _play_memory():
	# --- FADE IN ---
	var fade_tween = create_tween().set_parallel(true)
	fade_tween.tween_property(fade_overlay, "color:a", 0.0, fade_in_duration)
	# fade_tween.tween_property(music_player, "volume_db", 0.0, music_fade_in_duration)
	await fade_tween.finished

	# --- START DIALOGUE ---
	var dialogue_box = get_node("/root/Memory0/CanvasLayer/DialougeBox")
	dialogue_box.start_dialogue()
	await dialogue_box.dialogue_finished

	# --- FADE OUT ---
	var fade_out_tween = create_tween().set_parallel(true)
	fade_out_tween.tween_property(fade_overlay, "color:a", 1.0, fade_out_duration)
	# fade_out_tween.tween_property(music_player, "volume_db", -80.0, music_fade_out_duration)
	await fade_out_tween.finished

	# --- RETURN TO MAIN SCENE ---
	get_tree().change_scene_to_file(MAIN_SCENE)
