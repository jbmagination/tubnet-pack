#version 150

#moj_import <fog.glsl>

in vec3 Position;

uniform mat4 ProjMat;
uniform mat4 ModelViewMat;
uniform int FogShape;

out float vertexDistance;

void main() { 
	vec4 pos = vec4(Position, 1.0);
	if(ProjMat[3][2] != -2.0) { // make sky cover entire sky
		pos = ProjMat * vec4(Position, 1.0);
		pos.y = -pos.z;
		//gl_FrontColor = vec4(0.0,0.0,0.0,1.0);
	} else { // vanilla behaivor (for text highlight)
		pos = ProjMat * ModelViewMat * vec4(Position, 1.0);
	}
	
	gl_Position = pos;
    vertexDistance = fog_distance(ModelViewMat, Position, FogShape);
}
