
shader_type canvas_item;

uniform float shake_power = 0.03;
uniform float shake_rate : hint_range(0.0, 1.0) = 0.2;
uniform float shake_speed = 5.0;
uniform float shake_block_size = 30.5;
uniform float shake_color_rate = 0.01;

float random(float seed) {
    return fract(543.2543 * sin(seed * 3471.135));
}

void fragment() {
    float glitch = float(
        random(floor(TIME * shake_speed)) < shake_rate
    );

    float block = floor(UV.y * shake_block_size)
        / shake_block_size;

    float offset = (random(block + floor(TIME * shake_speed)) - 0.5)
        * shake_power * glitch;

    vec2 uv = UV + vec2(offset, 0.0);

    vec4 col = texture(TEXTURE, uv);

    float red = texture(
        TEXTURE,
        uv + vec2(shake_color_rate, 0.0)
    ).r;

    float blue = texture(
        TEXTURE,
        uv - vec2(shake_color_rate, 0.0)
    ).b;

    col.r = mix(col.r, red, glitch);
    col.b = mix(col.b, blue, glitch);

    COLOR = col;
}


 