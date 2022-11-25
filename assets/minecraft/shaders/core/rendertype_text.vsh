#version 150

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform vec2 ScreenSize;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
	
	// delete sidebar numbers (TubNet yamama)
	if(Position.z == 0.0 && gl_Position.x >= 0.90 && gl_Position.y >= -0.35 && vertexColor.b == 84.0/255.0 && vertexColor.g == 84.0/255.0 && vertexColor.r == 252.0/255.0 && gl_VertexID <= 4) 
		gl_Position = ProjMat * ModelViewMat * vec4(ScreenSize + 500.0, 0.0, 0.0);
}
