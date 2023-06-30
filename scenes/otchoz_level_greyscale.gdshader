shader_type canvas_item;
uniform vec2 player_position = vec2(0.5f);
uniform float intensity: hint_range(0.0f, 1.0f);
uniform float brightness: hint_range(0.0f, 1.0f);
uniform float contrast: hint_range(0.0f, 1.0f);
uniform float saturation: hint_range(0.0f, 1.0f);

void fragment() {
    COLOR = texture(TEXTURE, UV);
	
	vec2 resolution = 1.0f / SCREEN_PIXEL_SIZE;
	
    vec2 current_pixel = SCREEN_UV * resolution;
	vec2 target_pixel = vec2(player_position.x, 1.0f - player_position.x) * resolution;
	float dist = distance(current_pixel, player_position);
	
	vec3 avg = vec3(COLOR.r * 0.2126 + COLOR.g * 0.7152 + COLOR.b * 0.0722);
    avg.rgb = mix(vec3(0.0f), avg.rgb, brightness);
    avg.rgb = mix(vec3(0.5f), avg.rgb, contrast);
    avg.rgb = mix(vec3(dot(vec3(1.0f), avg.rgb)*0.33333), avg.rgb, saturation);
	
	float radius = intensity * length(resolution);
	
	float ratio = clamp(1.0f + dist - radius, 0.f, 1.f);
    COLOR.rgb = COLOR.rgb * ratio + avg * (1.0f - ratio);
}
