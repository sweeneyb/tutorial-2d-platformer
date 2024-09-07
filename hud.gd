extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MessageTimer.start()
	await $MessageTimer.timeout
	$Message.text = ""
	$Message.show()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
