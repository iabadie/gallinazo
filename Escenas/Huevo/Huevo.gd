extends Node2D

func _on_VisibilityEnabler2D_viewport_entered( viewport ):
	$AnimacionHuevo.play("movimiento_huevo")

func _on_VisibilityEnabler2D_viewport_exited( viewport ):
	$AnimacionHuevo.stop()
