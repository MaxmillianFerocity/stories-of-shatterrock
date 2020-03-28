extends "BaseStat.gd"


func roll_stat() -> int:
	return (randi() % 100 + 1) + value

func roll_against_check(difficulty_check : int) -> float:
	return clamp(roll_stat() - difficulty_check, 0, 999)
