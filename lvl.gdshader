shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;

uniform vec2 red_offset = vec2(0.0, 0.0);
uniform vec2 green_offset = vec2(0.0, 0.0);
uniform vec2 blue_offset = vec2(0.0, 0.0);
uniform float alpha = 1.0;
uniform float rand_strength = 1.0;

uniform vec4 affected = vec4(0.0, 0.0, 1.0, 1.0);

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5451);
}

vec4 chroma(vec2 uv, sampler2D tex) {
	vec4 col = texture(tex, uv);
	if (abs(red_offset.x) + abs(red_offset.y) > 0.001) {
		col.r = texture(tex, vec2(uv.x + red_offset.x * 0.1, uv.y + red_offset.y * 0.1)).r;
	}
	if (abs(green_offset.x) + abs(green_offset.y) > 0.001) {
		col.g = texture(tex, vec2(uv.x + green_offset.x * 0.1 , uv.y + green_offset.y * 0.1)).g;	
	}
	if (abs(blue_offset.x) + abs(blue_offset.y) > 0.001) {
		col.b = texture(tex, vec2(uv.x + blue_offset.x * 0.1, uv.y + blue_offset.y * 0.1)).b;
	}
	
	return col;
}

float Hash21(vec2 p) {
	p = fract(p*vec2(123.34, 456.21));
	p += dot(p, p+45.32);
	
	return fract(p.x*p.y);
}

void fragment() {
	vec4 mo = COLOR;
	vec2 normal_uv = UV;
	vec4 normal_col = texture(existing_screen_texture, UV);
    if (normal_uv.x < affected.x || normal_uv.y < affected.y || normal_uv.x > affected.x + affected.z || 
	normal_uv.y > affected.y + affected.a || mo.a == 0.0){
		COLOR = normal_col;
	}
	else {
		vec4 col = chroma(UV, existing_screen_texture);
		col = col*mo;
		col.a = col.a * alpha * 0.5;
		vec2 id = floor(UV * 120.0);
		float alpha_rand = Hash21(id + floor(TIME*70.0));
		col = col * (alpha_rand + (rand_strength * (1.0-alpha_rand)));
		COLOR = col*1.5;
	}
}