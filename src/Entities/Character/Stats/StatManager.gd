extends "../BaseManager.gd"

signal health_changed(old_health, new_health, max_health)
signal stamina_changed(old_stamina, new_stamina, max_stamina, stamina_rate)
signal morale_changed(old_morale, new_morale, max_morale)
signal encumberance_changed(old_encumberance, new_encumberence, max_encumberence)
signal action_points_changed(old_ap, new_ap, max_ap)
signal initiative_changed(old_initiative, new_initiative)
signal dodge_changed(old_dodge, new_dodge)
signal pain_threshold_changed(old_threshold, new_threshold)
signal reputation_changed(old_reputation, new_reputation)



func _init() -> void:
	stat = {
		health = {current = 0, max = 0},
		stamina = {current = 0, max = 0, rate = 0},
		morale = {current = 0, max = 0},
		encumberance = {current = 0, max = 0},
		action_points = {current = 0, max = 0},
		initiative = 0,
		dodge = 0,
		pain_threshold = 0,
		reputation = 0,
	}



func change_current_health(value : int) -> void:
	set_current_health(clamp(get_current_health() + value, 0, get_max_health()))


func change_current_stamina(value : int) -> void:
	set_current_stamina(clamp(get_current_stamina() + value, 0, get_max_stamina()))


func change_current_morale(value : int) -> void:
	set_current_morale(clamp(get_current_morale() + value, 0, get_max_morale()))


func change_current_encumberance(value : int) -> void:
	set_current_encumberance(clamp(get_current_encumberance() + value, 0, get_max_encumberance()))



func set_current_health(value : int) -> void:
	var old_health : int = get_current_health()
	stat.health.current = value
	emit_signal("health_changed", old_health, get_current_health(), get_max_health())


func set_max_health(value : int) -> void:
	stat.health.max = value
	
	if get_current_health() > get_max_health():
		stat.health.current = get_max_health()
	
	emit_signal("health_changed", get_current_health(), get_current_health(), get_max_health())


func set_current_stamina(value : int) -> void:
	var old_stamina : int = get_current_stamina()
	stat.stamina.current = value
	emit_signal("stamina_changed", old_stamina, get_current_stamina(), get_max_stamina(), get_stamina_rate())


func set_max_stamina(value : int) -> void:
	stat.stamina.max = value
	
	if get_current_stamina() > get_max_stamina():
		set_current_stamina(get_max_stamina())
		return
	
	emit_signal("stamina_changed", get_current_stamina(), get_current_stamina(), get_max_stamina(), get_stamina_rate())


func set_stamina_rate(value : int) -> void:
	stat.stamina.rate = value
	emit_signal("stamina_changed", get_current_stamina(), get_current_stamina(), get_max_stamina(), get_stamina_rate())


func set_current_morale(value : int) -> void:
	var old_morale : int = get_current_health()
	stat.morale.current = value
	emit_signal("morale_changed", old_morale, get_current_morale(), get_max_morale())


func set_max_morale(value : int) -> void:
	stat.morale.max = value
	
	if get_current_morale() > get_max_morale():
		set_current_morale(get_max_morale())
		return
	
	emit_signal("morale_changed", get_current_morale(), get_current_morale(), get_max_morale())


func set_current_encumberance(value : int) -> void:
	var old_encumberance : int = get_current_encumberance()
	stat.encumberance.current = value
	emit_signal("encumberance_changed", old_encumberance, get_current_encumberance(), get_max_encumberance())


func set_max_encumberance(value : int) -> void:
	stat.encumberence.max = value
	emit_signal("encumberance_changed", get_current_encumberance(), get_current_encumberance(), get_max_encumberance())


func set_current_action_points(value : int) -> void:
	var old_ap : int = get_current_action_points()
	stat.action_points.current = value
	emit_signal("action_points_changed", old_ap, get_current_action_points(), get_max_action_points())


func set_max_action_points(value : int) -> void:
	stat.action_points.max = value
	
	if get_current_action_points() > get_max_action_points():
		set_current_action_points(get_max_action_points())
		return
	
	emit_signal("action_points_changed", get_current_action_points(), get_current_action_points())


func set_initiative(value : int) -> void:
	var old_initiative : int = get_initiative()
	stat.initiative = value
	emit_signal("initiative_changed", old_initiative, get_initiative())


func set_dodge(value : int) -> void:
	var old_dodge : int = get_dodge()
	stat.dodge = value
	emit_signal("dodge_changed", old_dodge, get_dodge())


func set_pain_threshold(value : int) -> void:
	var old_threshold : int = get_pain_threshold()
	stat.pain_threshold = value
	emit_signal("pain_threshold_changed", old_threshold, get_pain_threshold())


func set_reputation(value : int) -> void:
	var old_reputation : int = get_reputation()
	stat.reputation = value
	emit_signal("reputation_changed", old_reputation, get_reputation())



func get_current_health() -> int:
	return stat.health.current


func get_max_health() -> int:
	return stat.health.max


func get_current_stamina() -> int:
	return stat.stamina.current


func get_max_stamina() -> int:
	return stat.stamina.max


func get_stamina_rate() -> int:
	return stat.stamina.rate


func get_current_morale() -> int:
	return stat.morale.current


func get_max_morale() -> int:
	return stat.morale.max


func get_current_encumberance() -> int:
	return stat.encumberance.current


func get_max_encumberance() -> int:
	return stat.encumberance.max


func get_current_action_points() -> int:
	return stat.action_points.current


func get_max_action_points() -> int:
	return stat.action_points.max


func get_initiative() -> int:
	return stat.initiative


func get_dodge() -> int:
	return stat.dodge


func get_pain_threshold() -> int:
	return stat.pain_threshold


func get_reputation() -> int:
	return stat.reputation
