extends CanvasLayer

var nextText = "loading..."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MessageTimer.start()
	$JsonGetData.request_completed.connect(_on_request_completed)
	$JsonGetData.request("https://collectionapi.metmuseum.org/public/collection/v1/objects/338756")
	await $MessageTimer.timeout
	$Message.text = nextText
	$Message.show()
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	nextText = json["primaryImage"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
