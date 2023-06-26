shader_type canvas_item;

// Ranges from 0 to 1 over the course of the transition.
// We use this to actually animate the shader.
uniform float progress : hint_range(0, 1);
uniform float direction : hint_range(-1, 1, 2);

uniform float x_modifier = 2.5;
uniform float y_modifier = 1.0;
uniform float progress_multipliyer = 4.0;

void fragment() {
	float coords = x_modifier * UV.x + y_modifier * UV.y;
	if (coords * direction > progress * progress_multipliyer * direction) {
		discard;
	}
}