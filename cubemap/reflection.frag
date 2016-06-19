#version 330 core

uniform vec3 camPos;
uniform samplerCube environmentMap;

in vec3 interpolatedNormal;
in vec3 pos;

out vec4 color;

void main() {
    vec3 viewDir = (pos - camPos);
    vec3 R = reflect(viewDir, normalize(interpolatedNormal));
	color  = vec4(texture(environmentMap, R).rgb, 1.0);
}

