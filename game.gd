extends Node2D

var base_block = preload("res://base.tscn")
var pos_x = 0
var pos_y = 0
var gap = 1
var margin = 0
var block_size = 10
var initial = true
var range_x = 174
var range_y = 96
var block_names=[]
var count = 0
var color_arr = ['VIOLET','LIGHT BLUE','GREEN','YELLOW','ORANGE','RED']
var draw_complete = false
func _ready():
	for _y in range(range_y):
		for x in range(range_x):
			if x == range_x-1:
				pos_y=block_size+base(count)-margin
				pos_x=0
				initial=true
			else:
				base(count)
				initial=false
			count+=1
	rename_blocks()
	draw_complete = true
	#for i in range(len(block_names)):
	#	print(block_names[i])
	
#func _physics_process(delta):
	if draw_complete:
		block_names[randi() % range_x*range_y].ColorRect.color = ColorN(color_arr[randi() % 6])
		#issue here
func base(count):
	block_names.append(base_block.instance())
	add_child(block_names[count])
	if initial:
		block_names[count].position.x=pos_x+gap+margin
		block_names[count].position.y=pos_y+gap+margin
	else:
		block_names[count].position.x=pos_x+block_size+gap
		block_names[count].position.y=pos_y+gap+margin
	pos_x=block_names[count].position.x
	return block_names[count].position.y

func rename_blocks():
	for i in range(range_x*range_y):
		block_names[i]=i
