shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 mo = COLOR;
	vec2 normal_uv = UV;
	vec4 normal_col = texture(existing_screen_texture, UV);
	vec4 col = texture(existing_screen_texture,UV);
	col = (vec4(1,1,1,2)-col)*mo;
	COLOR = col;
}