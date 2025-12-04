shader_type canvas_item;

uniform float threshold = 0;
uniform bool affect_x = true;
uniform bool flip_x = false;
uniform bool affect_y = true;
uniform bool flip_y = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (affect_x)
	{
		if (UV.x < threshold && flip_x) COLOR.a = 0.0;
		else if (UV.x > threshold && !flip_x) COLOR.a = 0.0;
	}
	if (affect_y)
	{
		if (UV.y < threshold && flip_y) COLOR.a = 0.0;
		else if (UV.y > threshold && !flip_y) COLOR.a = 0.0;
	}
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
