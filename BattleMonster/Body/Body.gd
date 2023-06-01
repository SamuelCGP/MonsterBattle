class_name Body
extends CharacterBody2D

# STAT TRIGGER LIST
signal stat_changed(stat_name, stat_value)
signal death

@onready var icon: Sprite2D = get_node("Icon")
@onready var attack_range_area: AttackRange = get_node("AttackRange")
@onready var bars: StatusBars = get_node("StatusBars")
#
@export var monster_resource: MonsterResource

# 🧠 INSTINCT
var instinct: Instinct

# ❤️ HEALTH
var max_health: int = 100 :
	set(value): 
		max_health = value
		bars.update_progress_bar(bars.health, health, max_health)
var health: int = 100 : 
	set(value): 
		health = value if value < max_health else max_health
		stat_changed.emit("health", health)
		bars.update_progress_bar(bars.health, health, max_health)
		if health <= 0:
			death.emit()
			queue_free()
var health_regen: int = 0

# ⚡ STAMINA
var max_stamina: int = 100 :
	set(value): 
		max_stamina = value
		bars.update_progress_bar(bars.stamina, stamina, max_stamina)
var stamina: int = 100 :
	set(value): 
		stamina = value if value < max_stamina else max_stamina
		stat_changed.emit("stamina", stamina)
		bars.update_progress_bar(bars.stamina, stamina, max_stamina)
var stamina_regen: int = 0

# 💧 MANA
var max_mana: int = 100 :
	set(value): 
		max_stamina = value
		bars.update_progress_bar(bars.mana, mana, max_mana)
var mana: int = 100 :
	set(value): 
		mana = value if value < max_mana else max_mana
		stat_changed.emit("mana", mana)
		bars.update_progress_bar(bars.mana, mana, max_mana)
var mana_regen: int = 0

# ATTACK RANGE
var attack_range = 1 :
	set(value):
		attack_range = value
		attack_range_area.area_range = value
# ⏩ SPEED
var speed: int = 50
# BASE DAMAGE
var damage: int = 1

# ATTACK DELAY (in seconds)
var attack_delay: int = 1

# ATTACK STAMINA COST
var attack_stamina_cost: int = 10

# COOLDOWNS (trackers)
var attack_cooldown: float = attack_delay :
	set(value):
		attack_cooldown = value if value >= 0.0 else 0.0

# IS ALLY?
var is_ally: bool = true
#------
@onready var brain = Brain.new(self)
@onready var eye = Eye.new(monster_resource.is_ally)
	
func initial_config():
	icon.texture = monster_resource.texture
	instinct = monster_resource.instinct
	name = monster_resource.name
	# ❤️ HEALTH
	max_health = monster_resource.health
	health = monster_resource.health
	health_regen = monster_resource.health_regen
	# ⚡ STAMINA
	max_stamina = monster_resource.stamina
	stamina = monster_resource.stamina
	stamina_regen = monster_resource.stamina_regen
	# 💧 MANA
	max_mana = monster_resource.mana
	mana = monster_resource.mana
	mana_regen = monster_resource.mana_regen
	# ⚔️ COMBAT
	attack_range = monster_resource.attack_range
	speed = monster_resource.speed
	damage = monster_resource.damage
	attack_delay = monster_resource.attack_delay
	attack_stamina_cost = monster_resource.attack_stamina_cost
	is_ally = monster_resource.is_ally
	
	if not monster_resource.is_ally:
		bars.stamina.visible = false
		bars.mana.visible = false
# ACTIONS


