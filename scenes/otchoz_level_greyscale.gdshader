shader_type canvas_item;
uniform float intensity: hint_range(0.0f, 1.0f);
uniform float brightness: hint_range(0.0f, 1.0f);
uniform float contrast: hint_range(0.0f, 1.0f);
uniform float saturation: hint_range(0.0f, 1.0f);

uniform vec3 trash_pos_1;
uniform vec3 trash_pos_2;
uniform vec3 trash_pos_3;
uniform vec3 trash_pos_4;

uniform bvec2 trash_pos;

void fragment() {
    COLOR = texture(TEXTURE, UV);
	
	vec2 resolution = 1.0f / SCREEN_PIXEL_SIZE;
	
    vec2 current_pixel = SCREEN_UV * resolution;
	float dist = distance(current_pixel, trash_pos_1.xy);
	dist = min(dist, distance(current_pixel, trash_pos_2.xy));
	dist = min(dist, distance(current_pixel, trash_pos_3.xy));
	dist = min(dist, distance(current_pixel, trash_pos_4.xy));
	
	vec3 avg = vec3(COLOR.r * 0.2126 + COLOR.g * 0.7152 + COLOR.b * 0.0722);
    avg.rgb = mix(vec3(0.0f), avg.rgb, brightness);
    avg.rgb = mix(vec3(0.5f), avg.rgb, contrast);
    avg.rgb = mix(vec3(dot(vec3(1.0f), avg.rgb)*0.33333), avg.rgb, saturation);
	
	float radius = intensity * length(resolution);
	
	float ratio = clamp(1.0f + dist - radius, 0.f, 1.f);
    COLOR.rgb = COLOR.rgb * ratio + avg * (1.0f - ratio);
}
