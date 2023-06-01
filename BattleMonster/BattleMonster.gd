class_name BattleMonster
extends Body

# ACTION TRIGGER LIST
signal dodge
signal block
signal hit(enemy_hit)
signal hability_used
# EFFECT TRIGGER LIST
signal critical_hit
signal resurrection

func _ready():
	initial_config() #body
	brain.initial_config()
	
	# Equipping itens
	var itens = monster_resource.itens
	for item in itens:
		item.effect.equip(self)

func _process(_delta):
	if Battle.time_scale <= 0: return
	eye.see(get_tree())
	brain.think()

func decrease_cooldowns():
	regen_stats()
	if attack_cooldown != 0:
		attack_cooldown -= 1

func regen_stats():
	# ❤️ HEALTH
	if health < max_health:
		health += health_regen
	# ⚡ STAMINA
	if stamina < max_stamina:
		stamina += stamina_regen
	# 💧 MANA
	if mana < max_mana:
		mana += mana_regen
