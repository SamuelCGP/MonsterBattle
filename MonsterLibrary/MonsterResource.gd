class_name MonsterResource
extends Resource

# 🚹 TEXTURE
@export var texture: Texture2D

# 🧠 INSTINCT
@export var instinct: Instinct

# NAME
@export var name: String

# ❤️ HEALTH
@export var health: int = 100
@export var health_regen: int = 1 # per second

# ⚡ STAMINA
@export var stamina: int = 100
@export var stamina_regen: int = 5 # per second

# 💧 MANA
@export var mana: int = 100
@export var mana_regen: int = 0 # per second

# ⚔️ COMBAT
@export var attack_range: int = 1 # ATTACK RANGE
@export var speed: int = 50 # MOVE SPEED
@export var damage: int = 10 # BASE DAMAGE
@export var attack_delay: int = 1 # ATTACK DELAY (in seconds)
@export var attack_stamina_cost: int = 10 # ATTACK STAMINA COST
@export var is_ally: bool = false # 😃 IS ALLY?

# ITEMS
@export var itens: Array[ItemResource]
