shader_type canvas_item;

uniform float threshold = 0;
uniform sampler2D texture_albedo;
uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

	if (UV.y < threshold) COLOR.a = 0.0;

	COLOR.rgb = texture(texture_albedo, UV).rgb;
	COLOR.a = texture(noise, UV).r;

	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
