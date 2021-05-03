extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _Get_Api_Data():
	$HTTPRequest.request("https://jsonplaceholder.typicode.com/todos/1")
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	var data = json.result
	setInterfaceData(data)
	pass # Replace with function body.

func setInterfaceData(data):
	$ID.text = str(data.id)
	$"User Id".text = str(data.userId)
	$Title.text = str(data.title)
	$Completed.text = str(data.completed)


func _on_PutDataOnAPI_button_up():
	var data = {
		"ID": 2,
		"Score":3,
		"UserName":"testTitle"
	}
	var query = JSON.print(data)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request("http://localhost:38596/api/setScoreBoardData",headers,false,HTTPClient.METHOD_POST,query)
	pass # Replace with function body.
