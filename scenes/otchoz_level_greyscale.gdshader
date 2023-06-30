shader_type canvas_item;
uniform float intensity: hint_range(0.0f, 1.0f);
uniform float brightness: hint_range(0.0f, 1.0f);
uniform float contrast: hint_range(0.0f, 1.0f);
uniform float saturation: hint_range(0.0f, 1.0f);

uniform vec3 trash_pos_1;
uniform vec3 trash_pos_2;
uniform vec3 trash_pos_3;
uniform vec3 trash_pos_4;
uniform vec3 trash_pos_5;
uniform vec3 trash_pos_6;
uniform vec3 trash_pos_7;
uniform vec3 trash_pos_8;
uniform vec3 trash_pos_9;
uniform vec3 trash_pos_10;
uniform vec3 trash_pos_11;
uniform vec3 trash_pos_12;
uniform vec3 trash_pos_13;
uniform vec3 trash_pos_14;

void fragment() {
    COLOR = texture(TEXTURE, UV);

	vec2 resolution = 1.0f / SCREEN_PIXEL_SIZE;

    vec2 current_pixel = SCREEN_UV * resolution;
	float dist = distance(current_pixel, trash_pos_1.xy);
	dist = min(dist, distance(current_pixel, trash_pos_2.xy));
	dist = min(dist, distance(current_pixel, trash_pos_3.xy));
	dist = min(dist, distance(current_pixel, trash_pos_4.xy));
	dist = min(dist, distance(current_pixel, trash_pos_5.xy));
	dist = min(dist, distance(current_pixel, trash_pos_6.xy));
	dist = min(dist, distance(current_pixel, trash_pos_7.xy));
	dist = min(dist, distance(current_pixel, trash_pos_8.xy));
	dist = min(dist, distance(current_pixel, trash_pos_9.xy));
	dist = min(dist, distance(current_pixel, trash_pos_10.xy));
	dist = min(dist, distance(current_pixel, trash_pos_11.xy));
	dist = min(dist, distance(current_pixel, trash_pos_12.xy));
	dist = min(dist, distance(current_pixel, trash_pos_13.xy));
	dist = min(dist, distance(current_pixel, trash_pos_14.xy));

	vec3 avg = vec3(COLOR.r * 0.2126 + COLOR.g * 0.7152 + COLOR.b * 0.0722);
    vec3 avg_contrast = avg;
	avg_contrast.rgb = mix(vec3(0.0f), avg_contrast.rgb, brightness);
    avg_contrast.rgb = mix(vec3(0.5f), avg_contrast.rgb, contrast);
    avg_contrast.rgb = mix(vec3(dot(vec3(1.0f), avg_contrast.rgb)*0.33333), avg_contrast.rgb, saturation);

	float radius = trash_pos_1.z * length(resolution);

	float ratio = clamp(1.0f + dist - radius, 0.f, 1.f);
	float noise_ratio = max(0.0, -pow(dist/radius, 3) + 1.0)* 0.5;
	
//	vec2 noise_uv = UV * 0.5;
//	float noise_a = fract(sin(dot(noise_uv, vec2(12.9898, 78.233) * TIME)) * 438.5453) * 1.9;
	
	COLOR.rgb = vec3(0.7, 1.0,0.2) * avg * noise_ratio 
				+ (COLOR.rgb * ratio + avg_contrast * (1.0f - ratio)) * (1.0f - noise_ratio);
}
